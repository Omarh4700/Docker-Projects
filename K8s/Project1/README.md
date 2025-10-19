# ⚙️ Kubernetes Lab – Multi-Namespace Deployment, Scaling & Resource Quotas

This lab focuses on deploying and managing multiple applications (Nginx and MySQL) in separate namespaces within a Kubernetes cluster.  
You’ll learn to work with **namespaces**, **services**, **scaling**, **resource quotas**, and **environment variables** — key skills for building real-world Kubernetes environments.

---

## 🧩 Lab Objectives

- Working with **Namespaces**  
- Deploying **Applications**  
- Managing **Services**  
- **Scaling** Deployments  
- Configuring **Resource Quotas**  
- **Verifying** Kubernetes Resources  
- Managing **Environment Variables**

---

## 🎯 Goal

> Deploy an Nginx application in a dedicated namespace, expose it via a Service, apply scaling and quotas,  
> and then deploy a MySQL instance in another namespace while managing environment variables dynamically.

---

## 🧠 Step-by-Step Implementation

All of the following steps are already combined in one YAML file:  
> 📝 **`app.yml`**  
Simply run it and watch the magic happen ✨

```bash
kubectl apply -f app.yml
```

1- Kubernetes will automatically create:
2- The `web-app` and `db-app` namespaces
3- The Nginx deployment and service
4- The ResourceQuota for the `web-app`
5- The MySQL deployment in the `db-app` namespace
---

## 🔍 Verify All Resources 
After Running the app.yml file you have to chech the namespace , Nginx Deployment ,pods , Service , ResourceQuota

```bash
kubectl get pods,deploy,svc,nodes,quota -n web-app -o wide
```

<img width="1192" height="270" alt="image" src="https://github.com/user-attachments/assets/0f1571b8-07ef-4785-9f55-639d987dca6b" />

---
## Test Connectivity
`curl http://<NODE_IP>:<NODE_PORT>`
```bash
curl http://192.168.49.3:31210
```
<img width="608" height="377" alt="image" src="https://github.com/user-attachments/assets/7fdf7ffd-eb84-431b-876f-e6f22eba62fc" />

## Test Quota Enforcement
Try to scale beyond the quota:

```bash
kubectl scale deployment nginx-deploy --replicas=10 -n web-app
```
> ⚠️ Kubernetes will block the request because it exceeds the defined quota.

---

## 🔐Add Environment Variables Manually
Use `kubectl set env` to add database credentials dynamically:
```bash
kubectl set env deployment/mysql-deployment MYSQL_ROOT_PASSWORD=omar MYSQL_DATABASE=omar -n db-app
```
You will see that your `env updated`  
to Verify:
```bash
kubectl describe deployment mysql-deployment -n db-app
```

<img width="978" height="560" alt="image" src="https://github.com/user-attachments/assets/f1863eda-eb0f-4eca-a619-adeecd29fe3c" />


