set -e
#--------------------------
# Set varibales
if [[ -z "$NEXUS_CREDS" ]]; then
    echo "Please provide nexus repo credentials"
    exit 1
fi
KEYCLOAK_VERSION=19.0.3
VIETTELCLOUD_SERVICES_VERSION=0.5.0
PATCH=13

#--------------------------
# Build custom event listener
cd keycloak/services

# Generate pom.xml
pip install jinja2-cli
jinja2 pom.xml.j2 -D KEYCLOAK_VERSION=${KEYCLOAK_VERSION} -D VIETTELCLOUD_SERVICES_VERSION=${VIETTELCLOUD_SERVICES_VERSION} --format xml > pom.xml

# Build artifact
# TODO: Download .m2 cache from raw repo when building with Jenkins
mkdir -p $HOME/.m2
docker run -it -v $HOME/.m2:/root/.m2 -v $(pwd):/root/build maven bash -c "cd /root/build && mvn clean install -Dmaven.wagon.http.ssl.insecure=true && exit"

# Push artifact to local repo
curl -u ${NEXUS_CREDS} \
    --upload-file ./target/viettelcloud-services-${VIETTELCLOUD_SERVICES_VERSION}-SNAPSHOT.jar \
    http://10.60.129.132/repository/raw-repo/cmp/iam/viettelcloud-services-${VIETTELCLOUD_SERVICES_VERSION}-SNAPSHOT.jar

#--------------------------
# Build docker image
cd -

docker build \
    --build-arg BASE_VERSION=${KEYCLOAK_VERSION} \
    --build-arg VIETTELCLOUD_SERVICES_VERSION=${VIETTELCLOUD_SERVICES_VERSION} \
    -t 10.60.129.132:8891/cmp/keycloak:${KEYCLOAK_VERSION}-${PATCH} .

docker push 10.60.129.132:8891/cmp/keycloak:${KEYCLOAK_VERSION}-${PATCH}
