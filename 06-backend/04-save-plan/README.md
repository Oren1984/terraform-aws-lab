# Task 34 – Save Plan and Apply

📌 **Goal:** Save Terraform plan to a file and apply from it.

---

## ✅ Steps Performed:

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Generate a Plan and Save It
```bash
terraform plan -out=tfplan
```

✔️ Plan created and saved locally in `tfplan`

### 3. Apply the Plan
```bash
terraform apply tfplan
```

✔️ Resource applied exactly as described in the plan file

### 4. Output the Results
```bash
terraform output
```

🟢 Output:
```
bucket_name = "oren-tf-plan-save-example"
```

---

## 🗂️ Files:
- `main.tf` – S3 resource definition
- `outputs.tf` – output value for bucket name
- `tfplan` – saved plan file
- `result.txt` – result summary
- `README.md` – documentation of the task
