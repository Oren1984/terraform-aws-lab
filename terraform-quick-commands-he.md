# 🚀 Terraform – מדריך פקודות מקוצר (AWS)

מדריך זה מרכז את הפקודות והשימושים העיקריים ב־Terraform, לפי שלבי עבודה סטנדרטיים מול AWS, על בסיס התרגילים שביצעת.

---

## 1️⃣ אתחול הפרויקט
```bash
terraform init
```
- מוריד את ה־Providers הנדרשים.
- מכין את סביבת העבודה הראשונית.

---

## 2️⃣ בדיקת השינויים לפני הרצה
```bash
terraform plan
```
- מציג מה יתווסף / ישתנה / יימחק.
- שימושי לוודא שהקוד מייצר את מה שאתה מתכנן.

**שמירת תכנית להרצה מאוחרת**:
```bash
terraform plan -out=tfplan
```

---

## 3️⃣ הפעלת השינויים
```bash
terraform apply
```
- מבצע בפועל את השינויים.

**הרצה אוטומטית ללא אישור**:
```bash
terraform apply -auto-approve
```

**הרצה מקובץ plan**:
```bash
terraform apply tfplan
```

---

## 4️⃣ הצגת פלטים (Outputs)
```bash
terraform output
```
- מציג ערכים שהוגדרו בקובץ `output.tf` (לדוגמה: כתובת IP של EC2, שם דלי S3 וכו').

---

## 5️⃣ השמדת משאבים
```bash
terraform destroy
```
- מוחק את כל המשאבים שהוגדרו בקבצי Terraform.

**ללא אישור ידני**:
```bash
terraform destroy -auto-approve
```

---

## 6️⃣ בדיקות נוספות
**גרסת Terraform**:
```bash
terraform version
```

**בדיקת קבצים ועיצוב קוד**:
```bash
terraform validate
terraform fmt
```

---

## 📦 דוגמאות מהירות – AWS
**יצירת IAM User**:
```bash
terraform init
terraform apply -auto-approve
```
*(כאשר בקובץ main.tf מוגדר משאב `aws_iam_user`)*

**יצירת S3 Bucket**:
```bash
terraform init
terraform apply -auto-approve
```
*(כאשר בקובץ main.tf מוגדר משאב `aws_s3_bucket`)*

**יצירת EC2 Instance**:
```bash
terraform init
terraform apply -auto-approve
```
*(כאשר בקובץ main.tf מוגדר משאב `aws_instance` עם מפתח SSH וקבוצת אבטחה)*

---

## 💡 טיפי עבודה
- **קבצי משתנים**: שמור ערכים רגישים ב־`terraform.tfvars` או ב־`*.auto.tfvars`.
- **Backend מרוחק**: שמור state ב־S3 לשיתוף בין צוותים.
- **תמיד תריץ `terraform plan` לפני `apply`** כדי להימנע מהפתעות.
