# 🚀 AWS Change Tracking & Audit System

A real-time, event-driven system to **track, audit, and monitor all changes across AWS environments**, providing complete visibility, accountability, and faster incident response.

---

## 📌 Problem Statement

In modern cloud environments, multiple teams and tools interact with AWS resources:

- AWS Management Console  
- CLI / SDK  
- Automated services (EKS, RDS, S3, etc.)

When something breaks in production:

❌ No clear visibility into *who made the change*  
❌ Difficult to trace *where the change originated*  
❌ Slower root cause analysis  

This leads to increased downtime and operational risk.

---

## 💡 Solution Overview

This project implements a **centralized change tracking system** that:

- ✅ Captures all AWS activity  
- ✅ Identifies *who made the change*  
- ✅ Tracks *source of action (Console / CLI / SDK / Services)*  
- ✅ Stores logs for auditing  
- ✅ Sends real-time alerts to stakeholders  

---

## 🏗️ Architecture

![Architecture Diagram](./architecture.png)

---

## ⚙️ How It Works

1. **Change Event Occurs**  
   Actions performed via Console, CLI, SDK, or AWS Services  

2. **Event Captured**  
   AWS CloudTrail logs all API activities  

3. **Event Filtering**  
   Focus on critical resources (EKS, RDS, S3, etc.)  

4. **Log Storage**  
   Events stored in Amazon S3 for auditing  

5. **Event Processing**  
   S3 triggers AWS Lambda  

6. **Notification**  
   Lambda processes logs and sends alerts via AWS SES  

7. **Outcome**  
   Real-time visibility for stakeholders  

---

## 🧰 Tech Stack

- AWS CloudTrail – Activity tracking & logging  
- Amazon S3 – Log storage  
- AWS Lambda – Event processing  
- AWS SES – Email notifications  
- AWS IAM – Access control  

---

## 🎯 Key Features

- 🔍 **Full Visibility** – Track every AWS change  
- 👤 **User Attribution** – Identify who made changes  
- 📡 **Source Detection** – Console / CLI / SDK / Services  
- ⚡ **Real-Time Alerts** – Immediate notifications  
- 🗂️ **Audit-Ready Logs** – Stored securely in S3  

---

## 🧠 Design Principles

- **Accountability** → Know who did what  
- **Traceability** → Track origin of changes  
- **Visibility** → Real-time awareness  
- **Noise Reduction** → Focus on critical events  

---

## 📈 Use Cases

- Production incident debugging  
- Security auditing & compliance  
- Unauthorized change detection  
- DevOps monitoring & governance  

---

## 🚀 Future Improvements

- 🔔 Slack / Teams integration  
- 📊 Dashboard (CloudWatch / Grafana)  
- 🧠 Intelligent alert filtering (reduce noise)  
- 🔗 Multi-account support  

---

## 🛠️ Setup Instructions

```bash
# Clone the repository
git clone https://github.com/shyama-devops/aws-change-tracking-audit-system.git

# Navigate to project directory
cd aws-change-tracking-audit-system
