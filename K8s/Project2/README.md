# 🚀 Kubernetes Lab – Namespaces, Scaling, Update Strategy & Resource Quotas

This project demonstrates the complete lifecycle of deploying, managing, and scaling applications in **Kubernetes**.  
It includes everything from namespace creation to deployment scaling, updates, and resource control — all managed declaratively using YAML manifests.

---

## 🧩 Project Overview

This lab provides a practical walkthrough of:

- Creating and Managing **Namespaces**
- Deploying and Configuring **Applications**
- Exposing Applications via **Services**
- Performing **Manual and Automatic Scaling**
- Applying and Verifying **Resource Quotas**
- Managing **Environment Variables**
- Performing **Rolling Updates** and **Rollbacks**

All steps (from Namespace creation to ResourceQuota configuration) are combined into **one comprehensive YAML file** for convenience:
> 📝 `all-files-in-one-file-justRun.yml`

You can simply apply it with:
```bash
kubectl apply -f all-files-in-one-file-justRun.yml
```
##  ⚙️ Lab Objectives

1. Create and manage a namespace (web-app)
2. Deploy an NGINX application
3. Expose it via a ClusterIP Service
4. Implement manual and automatic scaling (HPA)
5. Configure and enforce ResourceQuota
6. Perform Rolling Updates and Rollbacks
7. Verify and inspect all created resources

---
### 🔁  Rolling Update
Update the NGINX image into a custom version (nginx:1.27):
```bash
kubectl apply -f deploy-nginx1.27.yml
```
---
⏪ Rollback
If needed, rollback the deployment to the previous version.

```bash
# Check rollout history
kubectl rollout history -n webapp deployment nginx-deployment

# Rollback to previous revision
 kubectl rollout undo -n webapp deployment nginx-deployment

# Verify rollback
kubectl describe -n webapp deployment nginx-deployment
kubectl get pods -n webapp
```

<img width="971" height="606" alt="image" src="https://github.com/user-attachments/assets/cb030622-dde1-482e-9eef-5863d88099e9" />

---
✅ Verification
```bash
kubectl get pods,svc,deploy,hpa,quota -n webapp
```

<img width="1141" height="245" alt="image" src="https://github.com/user-attachments/assets/5a8af736-8783-4bbb-af9c-9c7a53b34466" />

