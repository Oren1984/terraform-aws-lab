Task 52 – Jenkins + Terraform (Simple Apply with AWS Access Keys)

Goal: Run terraform init and terraform apply via Jenkins using AWS access keys stored as Jenkins credentials.

This task provisions an S3 bucket with Terraform from a Jenkins Declarative Pipeline.

Repo Layout
15-jenkins-terraform-pipeline/
├─ Jenkinsfile
├─ main.tf
├─ variables.tf
└─ versions.tf


S3 bucket names are global. The Terraform code adds a short random suffix to avoid collisions.

Terraform (main.tf)
resource "random_id" "suffix" { byte_length = 2 }

resource "aws_s3_bucket" "example" {
  bucket = "jenkins-tf-demo-${random_id.suffix.hex}"
  acl    = "private"
}

output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "Provisioned S3 bucket name"
}

Jenkins Credentials

Create two Secret Text credentials in Jenkins:

ID: aws-access-key-id → value: your AWS_ACCESS_KEY_ID

ID: aws-secret-access-key-id → value: your AWS_SECRET_ACCESS_KEY

Jenkinsfile (Lecturer’s minimal version)
pipeline {
  agent any

  stages {
    stage('Code Checkout') {
      steps {
        // Use your repo + branch
        git branch: 'main', url: 'https://github.com/Oren1984/terraform-aws-lab.git'
      }
    }

    stage('Terraform init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Apply') {
      steps {
        // Inject AWS creds only in this block
        withCredentials([
          string(credentialsId: 'aws-access-key-id',        variable: 'AWS_ACCESS_KEY_ID'),
          string(credentialsId: 'aws-secret-access-key-id', variable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh '''
            export AWS_DEFAULT_REGION="us-east-1"
            terraform apply -auto-approve
          '''
        }
      }
    }
  }
}

Run it

Push this folder to your repo.

Create a Jenkins Pipeline that points to the repo.

Ensure the two credentials exist (aws-access-key-id, aws-secret-access-key-id).

Run the pipeline → it should create an S3 bucket.

Cleanup
terraform destroy -auto-approve


Notes

For production, prefer OIDC or IAM role on the agent over long-lived keys.

Consider remote state (S3 + DynamoDB) if collaborating.
