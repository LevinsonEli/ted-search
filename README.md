# TED-search with terraform

This project deploys a three-tier application to AWS using Terraform. The architecture includes:

- **ted-search**: An application designed to search for articles.
- **memcached**: A caching layer used to enhance search performance and speed up data retrieval.
- **nginx**: A load balancer and static file server to manage incoming traffic and serve static assets.

![architecture](diagram.png)

## Technologies and Features

* Jenkins: For CI/CD pipelines.
* Terraform: For Infrastructure as Code (IaC) deployments.
* Memcached: For efficient search in ted-search app.
* Nginx: For load balancing and serving static files.
* Amazon ECR: For Docker image storage.
* Amazon S3: For storing Terraform state.
* IAM Roles: For managing permissions for EC2 instances.
* Security Groups: For controlling network traffic.
* GitLab: For version control.

**#Jenkins #CI/CD #terraform #nginx #AWS #loadbalancing #ECR #docker #S3 #IAM #SecurityGroups #NetworkSecurity**