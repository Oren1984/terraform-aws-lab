# Terraform Modules & Integrations – Summary

This directory contains multiple Terraform tasks, from basic reusable modules to advanced CI/CD and security integrations.

---

## 🧩 Core Terraform Modules
- **01-iam-user-module** – Create IAM users with a reusable module.  
- **02-ec2-module** – Launch EC2 instances using a module.  
- **03-s3-module** – Create S3 buckets using a module.  
- **04-github-ec2-module** – Example: consume a module directly from GitHub.  
- **05-ReadOnlyGroup** – Remote module usage: IAM user with ReadOnly group.  
- **06-Administrators** – Remote module usage: IAM user with Admin group.

---

## 🌍 Workspaces
- **07-default-workspace** – Observe default workspace.  
- **08-new-workspace** – Create and use a new workspace (`dev`).  
- **09-switch-workspaces** – Switch between workspaces (default/dev).  
- **10-workspace-specific-behavior** – Different configs per workspace.  
- **11-manage-workspaces** – List and delete workspaces.

---

## 🔒 Security Scanning with Checkov
- **12-install-checkov** – Install Checkov on Ubuntu.  
- **13-checkov-iam-scan** – Detect overly permissive IAM policy.  
- **14-checkov-multi-scan** – Scan larger project (S3 + SG misconfigs).

---

## ⚙️ CI/CD Integrations
- **15-jenkins-terraform-pipeline** – Run Terraform via Jenkins pipeline with AWS credentials.  
- **16-github-actions-terraform** – Terraform plan/apply with GitHub Actions + AWS access keys.  
- **17-github-actions-terraform-workspaces** – Use workspaces in GitHub Actions.  
- **18-github-actions-terraform-oidc** – Secure GitHub Actions → AWS with OIDC IAM role (no keys).

---

## 📝 Notes
- All tasks are **independent** examples.  
- Modules are **reusable** across projects.  
- Workspaces demonstrate **environment isolation**.  
- CI/CD tasks show both **classic (keys)** and **modern (OIDC)** integrations.  
- Security tasks introduce **Checkov** for IaC scanning.  

---


_Last Updated: August 2025_  
_Author: Oren_
