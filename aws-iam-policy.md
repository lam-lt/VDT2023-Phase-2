# AWS IAM Policy
An AWS IAM Policy is a document that defines the permissions that an IAM entity (user, group, or role) has to AWS resources. Policies are attached to IAM entities to grant them access to the corresponding resources.

An IAM policy is a JSON document:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "s3:CreateBucket",
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": [
        "arn:aws:s3:::my-bucket"
      ]
    }
  ]
}
```
- **Version**: specifies the version of the policy
- **Statement**: an array contains statements. Each statement specifies a permission that is granted to an IAM entity.
- **Sid**: statement ID
- **Effect**: specifies whether the permission is allowed or denied
- **Action**: specifies the actions that are allowed
- **Resource**: specifies the resource that the actions are allowed to use