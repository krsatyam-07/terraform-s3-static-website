# Terraform S3 Static Website

This repository contains Terraform configuration files to deploy a static website hosted on AWS S3. The S3 bucket is configured as a static website with public read access, and it supports hosting `index.html` and `error.html`.

## Features

- **S3 Bucket Creation**: Automatically creates an S3 bucket configured as a static website.
- **Public Read Access**: Applies a bucket policy to allow public read access to the website.
- **Custom Error Pages**: Configures `error.html` as the custom error document.
- **Terraform Best Practices**: Follows modular and reusable Terraform practices.

## Prerequisites

Before using this Terraform configuration, ensure you have the following installed and configured:

1. **Terraform**: Install Terraform from [https://www.terraform.io/](https://www.terraform.io/).
2. **AWS CLI**: Configure the AWS CLI with appropriate permissions:
   ```bash
   aws configure
   ```
3. **Git**: Install Git from [https://git-scm.com/](https://git-scm.com/).

## Repository Structure

The repository contains the following files:

| File                  | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| `provider.tf`         | Defines the AWS provider configuration.                                    |
| `resource.tf`         | Contains the Terraform resources for the S3 bucket, bucket policy, and website configuration. |
| `backend.tf`          | Configures the Terraform backend (optional).                                |
| `index.html`          | The main HTML file for the static website.                                 |
| `error.html`          | The custom error page for the static website.                              |
| `output.tf`           | Outputs useful information such as the S3 bucket name and website URL.     |

## Usage

Follow these steps to deploy the static website using Terraform:

### 1. Clone the Repository

Clone this repository to your local machine:
```bash
git clone https://github.com/krsatyam-07/terraform-s3-static-website.git
cd terraform-s3-static-website
```

### 2. Initialize Terraform

Initialize the Terraform working directory:
```bash
terraform init
```

### 3. Review the Plan

Preview the changes Terraform will make:
```bash
terraform plan
```

### 4. Apply the Configuration

Apply the Terraform configuration to create the S3 bucket and deploy the static website:
```bash
terraform apply
```

You will be prompted to confirm the changes. Type `yes` to proceed.

### 5. Access the Website

Once the deployment is complete, Terraform will output the website URL. You can access the website in your browser using the provided URL.

Example:
```
Website URL: http://<bucket-name>.s3-website.<region>.amazonaws.com
```

## Example Files

### `index.html`
```html
<!DOCTYPE html>
<html>
<head>
    <title>My Static Website</title>
</head>
<body>
    <h1>Welcome to My Static Website!</h1>
    <p>This website is hosted on AWS S3 using Terraform.</p>
</body>
</html>
```

### `error.html`
```html
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h1>Oops! Something went wrong.</h1>
    <p>The page you are looking for does not exist.</p>
</body>
</html>
```

## Security Considerations

- **Public Access**: The S3 bucket policy allows public read access to the website. Ensure this aligns with your security requirements.
- **Sensitive Data**: Avoid hardcoding sensitive information in your Terraform files. Use environment variables or AWS IAM roles for credentials.
- **Block Public Access**: If you no longer need public access, update the bucket policy or enable **Block Public Access** settings.

## Cleanup

To delete the S3 bucket and all associated resources, run:
```bash
terraform destroy
```

You will be prompted to confirm the deletion. Type `yes` to proceed.