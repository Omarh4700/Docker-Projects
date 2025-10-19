# 🐳 Dockerizing a Simple Python Flask Microservice

## 📘 Project Overview

This project demonstrates how to **containerize a lightweight Python Flask microservice** that serves as a simple health endpoint (`/`).  
It represents part of a migration from a **monolithic application** to a **Microservices Architecture**.

The resulting Docker image is designed to be:
- **Lightweight** — using a minimized base image.
- **Production-ready** — runs efficiently and securely.

🔗 **Source Code:** [GitHub Repository](https://github.com/abdelrahmanonline4/EFE-Labs-/tree/Master/Lab2)

---

## 🧩 Required Deliverables

The following files are required for submission:

| File | Description |
|------|--------------|
| **app.py** | Core Flask application code |
| **requirements.txt** | Python dependencies list |
| **Dockerfile** | Instructions for building the container image |

---
## 🧪 Verification Steps
### 1.Build the Docker Image
`docker build -t flaskapp:1.0v . `

### 2.Run the Container
`docker run -d --name flaskcont -p 8080:5000 flaskapp:1.0v`
### 3.Verify the Application
Use curl or your browser to check the endpoint:

`curl http://localhost:8080`

<img width="658" height="48" alt="image" src="https://github.com/user-attachments/assets/296f7874-c5cd-40b0-9b09-e8ba9eed692a" />

> ✅ Expected Output:Hello from Flask running inside Docker! Welcome, DevOps Engineer!

---
## 🧰 Tools & Technologies
- Python 3.11
- Flask
- Docker
