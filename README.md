# CI/CD Azure DevOps Pipelines (VSTS) for Website Deployment (BE/FE)

## Architecture

Architectural view of the CI/CD Pipelines dispositions (Parametrized Build accordingly to the chosen environment & Automated Release and Deployment)

![alt text](https://raw.githubusercontent.com/luchitrillo/azdevopspipes/master/azdevopspipes.png)

Every single YAML file (.json) represents each pipeline for Build and Release.

## Notifications

Webhook notifiactions are made with the inner MS Teams webhook configurations (app) and into the proper and associated Release Pipelines steps with the following strcuture:

```
## PROJECT: $(System.TeamProject)
- **TRIGGER:** $(Release.RequestedFor)
- **BRANCH:** $(Build.SourceBranchName)
- **COMMIT:** $(Build.SourceVersion)
- **BUILD:** $(Build.BuildNumber)
- **RELEASE:** $(Release.ReleaseName)
- **ENVIRONMENT:** $(Agent.Name)
```
Azure DevOps pipeline notifiaction step configuration:

![alt text](https://raw.githubusercontent.com/luchitrillo/azdevopspipes/master/Notifications/azdevopspostmessage.png)
