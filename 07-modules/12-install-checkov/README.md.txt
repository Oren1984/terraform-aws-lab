# Task 49 – Install Checkov on Ubuntu

**Goal:** Install [Checkov](https://www.checkov.io/) (by Bridgecrew/Palo Alto) and verify it works.  
Checkov is a static analysis tool for scanning IaC (Terraform, CloudFormation, Kubernetes, Helm, ARM, etc.) for misconfigurations and security issues.  
This task introduces Checkov as part of our security modules (similar to Trivy for vulnerabilities scanning).

---

## Steps

1. **Update Ubuntu**
```bash
sudo apt update && sudo apt upgrade -y


Install Python3 and pip

sudo apt install -y python3 python3-pip


Install Checkov

sudo pip3 install checkov


Verify installation

checkov --version

Expected Outcome

Checkov installs successfully.

Running checkov --version prints the installed version (e.g., Checkov 3.x.x).

Checkov is now ready to scan Terraform code and other IaC templates.

Next Steps

Use checkov -d . inside a Terraform project folder to scan all .tf files.

Integrate Checkov into CI/CD pipelines for automated security checks.

Compare with Trivy:

Trivy → focuses on container/image/vulnerability scanning.

Checkov → focuses on IaC misconfiguration and policy compliance.