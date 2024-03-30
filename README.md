# CI/CD Workflow for Node.js Application Deployment

This repository contains a GitHub Actions workflow for continuous integration and continuous deployment (CI/CD) of a Node.js application. The workflow consists of two main jobs:

1. **test-build**: This job checks out the code, sets up Node.js environment, installs dependencies, formats the code, performs linting, runs tests, and finally builds the application. The artifacts generated during the build process are uploaded for further use.

2. **terraform_deploy**: This job provisions an EC2 instance on AWS using Terraform. It depends on the artifacts generated in the previous job. It checks out the code, sets up Terraform, configures AWS credentials, initializes Terraform, validates the Terraform configuration, plans the infrastructure changes, and applies the changes to deploy the application. Finally, it downloads the artifacts and deploys them to the provisioned EC2 instance using SCP.

## Workflow Setup

### Prerequisites

- An AWS account with appropriate permissions to provision EC2 instances.
- GitHub repository with the Node.js application code.
- AWS access key ID, secret access key, and session token stored as GitHub secrets.
- SSH private key stored as GitHub secret to access the EC2 instance.

### Configuration

1. Ensure that your Node.js application has the necessary scripts defined in `package.json` for formatting, linting, testing, and building.

2. Configure the AWS credentials and SSH private key in the GitHub repository settings as secrets. Use the following names for the secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_SESSION_TOKEN`
   - `SSH_PRIVATE_KEY`

3. Adjust the workflow file (`ci-cd.yml`) according to your project structure and requirements. Update any environment variables, file paths, or commands as needed.

4. Commit the changes to your repository to trigger the GitHub Actions workflow.

## Usage

- Upon pushing changes to the repository, the CI/CD workflow will automatically trigger, starting with the `test-build` job followed by the `terraform_deploy` job.
- Monitor the workflow execution in the Actions tab of your GitHub repository.
- Once the workflow is completed successfully, your Node.js application will be deployed to the provisioned EC2 instance.


## License

This project is licensed under the [MIT License](LICENSE).
