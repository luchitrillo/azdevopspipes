# CI/CD Azure DevOps Pipelines (VSTS) with Terraform (IaC)

## Architecture

Architectural view of the CI/CD Pipeline disposition (Parametrized Build accordingly to chosen variables values in build configuration & Automated Release and Deployment)

![alt text](https://raw.githubusercontent.com/luchitrillo/azdevopspipes/master/iac-ado-pipeline.png)

## Templates

- Every single YAML file (.json) represents each pipeline for Build and Release.
- Every single TERRAFORM file (.tf) represents each IaC template to rise up new infrastructure in Azure.
