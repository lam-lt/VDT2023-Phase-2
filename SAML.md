# SAML (Security Assertion Markup Language)


## What is SAML?
SAML (stands for **Security Assertion Markup Language**) is an **XML-based open standard data format** for exchanging identity data between Identity Provider and Service Provider.
- **Identity Provider**:\
    Performs authentication and passes the identity and authorization information to Service Provider.
- **Service Provider**:\
    Receives the identity and authorization information from Identity Provider and grants access to its resources.

## How does SAML work?
Imagine when user U wants to access **service S**, **service S** will ask **Identity Provider I** about the validation of **user S**. This processing will go as the following:
- **User U** try to access **service S** via a browser
- **Service S** asks **Identity Provider I** to authenticate user U by generating a SAML request
- The browser redirects **user U** to SSO url of **identity provider I**
- The **identity provider I** parses the SAML request, then it authenticates **user U** by asking **U** to provide credentials if **U** hasn't logged-in.
- The **identity provider I** sends the encoded SAML response to the browser
- The browser sends the SAML response to **service S** for verification
- If the verification is successful, the **user S** will be logged-in to **S** and granted access to the resources that they are authorized to view/modify.

![SAML-workflow](./images/saml_guidance_saml_flow.png)
*SAML workflow*

## SAML vs. OAuth 2.0
*"SAML and OAuth2 are open standard protocols designed with different, but related goals. Primarily, SAML 2.0 is designed to authenticate a user, so providing user identity data to a service. OAuth 2.0 is designed as an authorization protocol permitting a user to share access to specific resources with a service provider."* - [SAML vs. OAuth - auth0](https://auth0.com/intro-to-iam/saml-vs-oauth)

### Differences
|  | SAML | OAuth 2.0 |
| --- | --- | --- |
| **Support SSO** | Yes | No |
| **Support authentication** | Yes | Yes (but focuses on authorization) |
| **Support authorization** | Yes (by using Attribute Query route) | Yes |
| **Using token and message encryption** | Yes | No |


*"From a technical point of view, SAML defines a token format, its encryption is complicated, and the size of the exchanged messages is significant. In contrast, OAuth2 doesn't use any message encryption (it relies on HTTPS) and doesn't define a token format. The attraction of OAuth2 lies in the ease of use and flexibility: it can be used in mobile devices, smart devices (e.g., smart TVs), Web apps, single-page apps, and so on. Many libraries are available to facilitate the integration process with different client types and service providers. SAML, in contrast, wasn’t designed with these modern applications in mind, making it more difficult to use on these systems. It is commonly used with traditional Web apps."* -  [SAML vs. OAuth - auth0](https://auth0.com/intro-to-iam/saml-vs-oauth)

### Use Case OAuth2 and SAML
- **SAML**:\
    SAML is typically used for SSO in government and enterprise applications (identity management), where backend system processing of XML is commonplace. Many government citizen ID schemes (e.g., UK Verify) are SAML based.

- **OAuth2**:\
    OAuth2 is widely used in consumer and enterprise applications, both in authorization and authentication roles. It is typically used to authorize access to RESTful APIs, where its use of access tokens makes it simple and attractive.