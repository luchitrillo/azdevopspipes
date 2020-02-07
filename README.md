# CI/CD Azure DevOps Pipelines (VSTS) with Terraform (IaC)

## Architecture

Architectural view of the CI/CD Pipelines dispositions (Parametrized Build accordingly to the chosen environment & Automated Release and Deployment)

![alt text](https://raw.githubusercontent.com/luchitrillo/azdevopspipes/master/az-devops-pipeline.png)

## Templates

- Every single YAML file (.json) represents each pipeline for Build and Release.
- Every single TERRAFORM file (.tf) represents each IaC template to rise up new infrastructure in Azure.
