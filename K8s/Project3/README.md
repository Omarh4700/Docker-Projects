# 🧩 Kubernetes Lab – MySQL Deployment with ConfigMaps, Secrets, PV/PVC, and Node Isolation

## 📘 Lab Overview
This lab demonstrates how to deploy a **MySQL database** in Kubernetes using best practices for configuration management, storage persistence, and node isolation.  
You will:
- Use **ConfigMaps** and **Secrets** for configuration and credentials.  
- Deploy **Persistent Volumes (PV)** and **Persistent Volume Claims (PVC)** for durable data storage.  
- Apply **Taints** and **Tolerations** to dedicate a specific node for the database.  
- Manage deployment and access using **Deployments** and **Services**.  
- Verify **resource binding** and **scheduling** across the cluster.  

---

## ⚙️ Objectives
- Deploy MySQL securely and persistently on a tainted worker node.  
- Practice environment configuration using external files.  
- Understand how Kubernetes handles storage binding, taint-based scheduling, and service discovery.  

---

## 🧠 Concepts Covered
1. **Working with ConfigMaps and Secrets**  
2. **Deploying Databases Using Persistent Storage (PV/PVC)**  
3. **Applying Taints and Tolerations for Node Isolation**  
4. **Managing Deployments and Services for Database Access**  
5. **Verifying Resource Binding and Scheduling in Kubernetes**  
6. **Practicing Secure Configuration and Environment Management**

---

##  Step-by-Step Instructions

### **Step 1 – Node Preparation**
Apply a **taint** on `minikube-m03` to restrict scheduling only to pods that tolerate it:
```bash
kubectl taint nodes minikube-m03 db=only:NoSchedule
```
---
### **Step 2 – Configuration Files**
Create two text files in your project directory
you can see them in the attached file with name 📄 `config.txt` and 📄 `secret-mysql.txt`

---
### **Step 3 – Kubernetes Resources**
#### **1. Create ConfigMap and Secret **
```bash
kubectl create configmap mysql-config --from-env-file=config.txt -n db-app
kubectl create secret generic mysql-secret --from-env-file=secret-mysql.txt -n db-app
```

#### **2. Create Persistent Volume (PV)**
📄 File: ``mysql-pv.yml``

#### **3. Create Persistent Volume Claim (PVC)**
📄 File: ``mysql-pvc.yml``

#### **4. Create MySQL Deployment**
📄 File: ``app.yml``

#### ** 5. Create MySQL Service **
📄 File: ``service.yml``

---
### **✅ Step 4 – Verification**
#### **1. Check all resources **
```bash
kubectl get all,pv,pvc -n db-app -o wide
```
<img width="1292" height="164" alt="image" src="https://github.com/user-attachments/assets/3eef9e25-0864-40f1-9f10-8c42d9e8f10d" />

#### **2. Ensure Pod is running on minikube-m03 **
```bash
kubectl get pod -o wide -n db-app
```

#### **3. Validate ConfigMap and Secret are loaded**
```bash
 kubectl exec -it mysql-deployment-55c49657c4-q9fgg -n db-app -- env | grep MYSQL
```
<img width="1014" height="256" alt="image" src="https://github.com/user-attachments/assets/d4b05d74-7c65-41fb-b800-6915a52c41a7" />

---

✅ Expected Outcome

1. The MySQL pod runs only on `minikube-m03`.
2. The ConfigMap and Secret provide configuration and credentials correctly.
3. The PVC is bound to the PV.
4. The Service allows internal cluster access on port 3306.
