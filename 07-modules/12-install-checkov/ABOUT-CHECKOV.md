# What is Checkov?

**Checkov** is an open-source static code analysis tool developed by Bridgecrew (now part of Palo Alto Networks).  
It scans **Infrastructure as Code (IaC)** frameworks to detect security and compliance misconfigurations *before* they reach production.

---

## Key Features
- 🔒 **Security scanning** for Terraform, CloudFormation, Kubernetes, Helm, ARM, Serverless, and more.
- ✅ **Policy as Code**: Uses built-in policies based on industry standards (CIS, NIST, PCI-DSS, etc.).
- ⚡ **Fast scanning**: Quickly checks `.tf` or YAML/JSON templates locally or in CI/CD pipelines.
- 🧩 **Extensible**: You can write custom policies using Python or YAML.
- 📊 **Integration ready**: Works well with GitHub Actions, Jenkins, GitLab CI, CircleCI, etc.
- 🌍 **Cloud posture management**: Helps ensure IaC templates follow best practices and organizational rules.

---

## Why Use Checkov?
- **Shift-left security**: Catch issues early, at code stage, before deployment.
- **Compliance**: Ensure infrastructure aligns with regulatory frameworks.
- **Developer-friendly**: Simple CLI tool that integrates into everyday workflows.
- **Complements other tools**:
  - Use **Trivy** for container/image/package vulnerability scanning.
  - Use **Checkov** for IaC configuration scanning.

---

## Example Use Cases
- Scan a Terraform project before applying:
  ```bash
  checkov -d .


Enforce policies in a CI/CD pipeline:

checkov -d . --quiet --compact


Write a custom policy (e.g., disallowing public S3 buckets).

Summary

Checkov = IaC Security & Compliance Scanner.
It is not about scanning software dependencies (like Trivy), but about verifying that your infrastructure definitions themselves are secure and compliant.
