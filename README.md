# Terragrunt App Demo

## About

This project deploys a complete single app structure with load balancer, autoscaling group, security groups, SSL certificate and a valid domin name.

## How To Deploy

This project depends on [Terragrunt VPC](https://github.com/Dev-Marques-Ops-Live-Infrastructure/terragrunt-vpc) deployment.

The application should be deployed in followed order:
```
tags > security_groups > rds > key_pair > launch_configuration > target_group > autoscaling_group > load_balancer > domain > lb_listener > lb_listener_rule > bastion
```

## Security

- **Application**
  - **Bastion Host:** Any user can access it since their private key is associated with the instance.
  - **Application Hosts:** There isn't incoming access, just can be accessed by SSH from Bastion Host.
  - **MySQL Instance:** Restricted access from application hosties IP range.
  - **Load Balancer:** Forward incoming traffic according to the domain name and encrypt all traffic by SSL protocol.
- 
## [Git-Crypt](https://github.com/AGWA/git-crypt)
  - **Gerenating a [GPG key](https://www.gnupg.org/documentation/manuals/gnupg/Unattended-GPG-key-generation.html):**
    - 1 - Centralize the informations key in a file:
  
    ```
    cat >~/gpg_key_informations <<EOF
       %echo Generating a basic OpenPGP key
       Key-Type: DSA
       Key-Length: 1024
       Subkey-Type: ELG-E
       Subkey-Length: 1024
       Name-Real: YOUR_NAME
       Name-Email: YOUR_EMAIL
       Expire-Date: 0
       Passphrase: YOUR_PASSWORD
       %commit
       %echo done
    EOF
    ``` 

    - 2 - Gerenatethe GPG key:
    ```
    gpg --batch --generate-key ~/gpg_key_informations
    ``` 
    - 3 - List the GPG Keys:
    ```
    gpg --list-secret-keys
    ```
    - 4 - Contact the project admin add your GPG Key.

## Structure

![Simple App](https://user-images.githubusercontent.com/5325106/164715583-09cbabc3-f554-401f-8312-f2233fcd52a2.png)