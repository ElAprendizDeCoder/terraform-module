# Azure Infrastructure Deployment with Jenkins and Terraform

This project automates the deployment of an Azure Virtual Machine (VM), Virtual Network (VNet), and Subnet using a Jenkins pipeline with Terraform.

## Prerequisites

- **Azure Subscription**: Ensure you have an active Azure subscription.
- **Service Principal**: Create a service principal for Terraform to authenticate with Azure.
- **Jenkins**: A running Jenkins instance with permissions to execute Terraform.
- **Terraform**: Installed on the Jenkins agent where the pipeline will run.
- **Azure Key Vault**: To securely store secrets like client credentials and access tokens.

## Project Structure

- **Jenkinsfile**: Pipeline configuration file for Jenkins.
- **environments/**: Directory containing environment-specific Terraform configuration files.
  - `dev.tfvars`, `qa.tfvars`, `prod.tfvars`: Variable files for different environments.
- **terraform/**: Directory with Terraform configurations for creating the Azure resources.

## Steps to Deploy

1. **Clone the Repository**: Clone this repository to access the Terraform configuration and Jenkinsfile.

    ```bash
    git clone https://github.com/your-repo/azure-deployment.git
    cd azure-deployment
    ```

2. **Setup Secrets in Azure Key Vault**:
   - Go to the [Azure Key Vault portal](https://portal.azure.com/) and add the following secrets:
     - `state-resource-group`: Resource group for Terraform state storage.
     - `state-storage-account`: Storage account name for Terraform state.
     - `state-storage-container`: Container for storing the Terraform state file.
     - `state-sas-token`: SAS token to access the storage container.
     - `client-id`, `client-secret`, `subscription-id`, `tenant-id`: Service principal credentials.
     - `DevsqlServerAdminPassword`, `QasqlServerAdminPassword`, `ProdsqlServerAdminPassword`: Passwords for SQL Server (if applicable).

3. **Configure Jenkins Pipeline**:
   - Create a new Jenkins pipeline job and point it to this repository.
   - Jenkins will automatically detect the `Jenkinsfile` in the root directory.

4. **Run the Pipeline**:
   - Trigger the pipeline in Jenkins to start the deployment process.
   - The pipeline consists of multiple stages:
     - `terraform_build`: Initializes and plans the Terraform infrastructure.
     - `development_env`: Deploys the planned infrastructure in the development environment.
   
5. **Monitor the Deployment**:
   - Check the Jenkins console output to follow the deployment process.
   - Artifacts (plans) will be saved in the Jenkins build workspace for later review.

## Jenkinsfile Structure

The `Jenkinsfile` defines two main stages:
- **Terraform Build**: Sets up the Terraform environment for Dev, QA, and Prod by fetching credentials from Azure Key Vault and initializing the Terraform backend.
- **Development Environment Deployment**: Deploys the infrastructure in the development environment.

## Environment Variables

These variables are defined in the `Jenkinsfile` and stored in Azure Key Vault:

| Variable                   | Description                                   |
|----------------------------|-----------------------------------------------|
| `state-resource-group`     | Resource group for Terraform state backend    |
| `state-storage-account`    | Storage account name for Terraform state      |
| `state-storage-container`  | Container name for Terraform state files      |
| `state-sas-token`          | SAS token for state storage access            |
| `client-id`                | Service principal client ID                   |
| `client-secret`            | Service principal client secret               |
| `subscription-id`          | Azure subscription ID                         |
| `tenant-id`                | Azure tenant ID                               |
| `prefixVmPassword`         | Admin password for the Virtual Machine        |

## Important Notes

- Ensure the service principal has Contributor access to the subscription.
- Update `dev.tfvars`, `qa.tfvars`, and `prod.tfvars` with appropriate values for each environment.

## Troubleshooting

- **Terraform State Locking**: If there are issues with state locking, ensure the SAS token and storage permissions are correctly configured.
- **Permissions**: Verify that the service principal has sufficient permissions to access the Azure Key Vault and deploy resources.

## Additional Resources

- [Azure Terraform Documentation](https://learn.microsoft.com/en-us/azure/developer/terraform/)
- [Jenkins Pipeline Documentation](https://www.jenkins.io/doc/book/pipeline/)


