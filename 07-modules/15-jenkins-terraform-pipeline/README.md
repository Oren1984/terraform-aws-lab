# Task 52 – Jenkins + Terraform (Simple Apply with AWS Access Keys)

**Goal:** Run `terraform plan` and `terraform apply` via Jenkins using AWS access keys.

This task provisions an S3 bucket with Terraform from a Jenkins Declarative Pipeline.

---

## Repo Layout
```
15-jenkins-terraform-pipeline/
├─ Jenkinsfile
├─ main.tf
├─ variables.tf
└─ versions.tf
```

> Bucket names are global. To avoid collisions, this example uses a short random suffix.

---

## Terraform (`main.tf`)
```hcl
resource "random_id" "suffix" {
  byte_length = 2
}

resource "aws_s3_bucket" "example" {
  bucket = "jenkins-tf-demo-${random_id.suffix.hex}"
  acl    = "private"
}

output "bucket_name" {
  value       = aws_s3_bucket.example.id
  description = "Provisioned S3 bucket name"
}
```

---

## Jenkins Credentials
In Jenkins, add two **Secret Text** credentials (or set them as environment variables in your agent):

- ID: `aws-access-key-id` → value: your **AWS_ACCESS_KEY_ID**
- ID: `aws-secret-access-key` → value: your **AWS_SECRET_ACCESS_KEY**

> Alternatively, use the **AWS Credentials** plugin (amazonWebServicesCredentials) and wrap stages with `withAWS`. This example sticks to standard environment bindings for simplicity.

---

## Jenkinsfile (Declarative)
```groovy
pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    AWS_DEFAULT_REGION    = 'us-east-1'
  }

  options {
    timestamps()
    ansiColor('xterm')
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
        sh 'pwd && ls -la'
      }
    }

    stage('Terraform Version') {
      steps {
        sh 'terraform -version'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Validate') {
      steps {
        sh 'terraform fmt -check || true'
        sh 'terraform validate'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -out=tfplan'
      }
    }

    stage('Terraform Apply') {
      when {
        anyOf {
          branch 'main'
          branch 'master'
        }
      }
      steps {
        sh 'terraform apply -auto-approve tfplan || terraform apply -auto-approve'
      }
    }
  }

  post {
    always {
      sh 'echo "Pipeline finished. Current workspace: $WORKSPACE"'
    }
  }
}
```

---

## Run it
1. Push this folder to your repo.
2. Create a Jenkins Multibranch Pipeline or Pipeline job pointing at the repo.
3. Ensure the two Jenkins credentials exist (`aws-access-key-id`, `aws-secret-access-key`).
4. Run the pipeline. On `main/master`, it should **apply** and create an S3 bucket.

---

## Cleanup
If you created real resources:
```bash
terraform destroy -auto-approve
```

---

## Security Notes
- Prefer **temporary credentials** (e.g., Jenkins agents with an IAM role, or OIDC to AWS) in real environments.
- Rotate keys regularly, limit permissions (least privilege), and enable MFA for console users.
- Consider remote state (S3 + DynamoDB) if teams collaborate.
