# Terragrunt App Demo

## About

This project deploys a complete single app structure with load balancer, autoscaling group, security groups, SSL certificate and a valid domin name.

## How To Deploy

This project depends on [Terragrunt VPC](https://github.com/Dev-Marques-Ops-Live-Infrastructure/terragrunt-vpc) deployment.

## Security

- **Bastion Host:** Any user can access it since their private key is associated with the instance.
- **Application Hosts:** There isn't incoming access, just can be accessed by SSH from Bastion Host.
- **MySQL Instance:** Restricted access from application hosties IP range.

- **Load Balancer:** Forward incoming traffic according to the domain name and encrypt all traffic by SSL protocol.

## Structure

![Simple App](https://user-images.githubusercontent.com/5325106/164715583-09cbabc3-f554-401f-8312-f2233fcd52a2.png)