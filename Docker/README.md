# 🧠 Docker Projects Overview

This repository showcases a series of hands-on Docker projects designed to demonstrate real-world DevOps practices — from building isolated container networks to deploying production-ready microservices.

---

## 🚀 Project 1 — Network Architecture & Load Balancing

### 🧩 Task 1: HR App Network Setup

**Objective:**  
Build a **dedicated and isolated Docker network** for a Human Resources (HR) application stack.

**Key Points:**
- Create a custom bridge network with a **defined subnet range**.
- Ensure **service discovery** via container names.
- Avoid **IP conflicts** with existing VPN or corporate subnets.
- Validate inter-container connectivity within the network.

**Outcome:**  
A secure and isolated Docker network that enables controlled communication between HR service containers.

---

### 🌐 Task 2: Multi-Homed Container Architecture (NGINX Load Balancer)

**Objective:**  
Implement a **multi-homed container setup** in Docker using **NGINX** as a load balancer.

**Key Points:**
- Connect NGINX to **two distinct, isolated networks**:
  - `frontend-net` (client-facing)
  - `backend-net` (internal communication)
- Demonstrate **traffic segregation** between external clients and backend services.
- Allow controlled routing through the NGINX load balancer.

**Outcome:**  
An architecture where NGINX bridges multiple networks securely, maintaining isolation between frontend and backend environments.

---

## 🧱 Project 2 — Containerized Application Stack

### 🐳 Task 1: Dockerizing a Simple Python Flask Microservice

**Objective:**  
Containerize a lightweight **Flask application** serving as a basic health endpoint (`/`).

**Key Points:**
- Migrate from a **monolithic** structure to a **microservices architecture**.
- Build a **minimal Docker image** optimized for production.
- Configure Flask to run on `0.0.0.0:5000` for external access.
- Prepare for **Kubernetes compatibility** and scalability.

**Outcome:**  
A secure and production-ready Flask microservice container that can be deployed independently or as part of a larger orchestrated system.

---

### 🧩 Task 2: NGINX & MySQL Local Development Stack

**Objective:**  
Set up a **local development environment** using **NGINX** (as the web server) and **MySQL** (as the database).

**Key Points:**
- Use **Docker Compose** for multi-container orchestration.
- Ensure **persistent storage** for MySQL data using volumes.
- Configure **secure communication** between NGINX and MySQL.
- Provide developer-friendly access for testing and iteration.

**Outcome:**  
A complete local environment that simulates a production-like stack, ideal for web app development and database integration testing.

---

## 🧰 Technologies Used

- **Docker** — Containerization
- **Docker Compose** — Multi-container orchestration
- **NGINX** — Reverse proxy & load balancer
- **Flask (Python)** — Lightweight microservice framework
- **MySQL** — Relational database
- **Bridge Networks** — Custom network segmentation

---
## 📦 Repository Structure

📂 **docker-projects/**  
├── 📁 **project1/**  
│   ├── 📁 **task1-hr-app-network/**  
│   └── 📁 **task2-multi-homed-nginx/**  
├── 📁 **project2/**  
│   ├── 📁 **task1-flask-microservice/**  
│   └── 📁 **task2-nginx-mysql-stack/**  
└── 📄 **README.md**

