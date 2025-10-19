## 🧩 Project Overview — NGINX & MySQL Local Development Stack

This project demonstrates how to set up a **local development environment** for a web application using **NGINX** as the public-facing web server and **MySQL** as the backend database.  
The focus is on ensuring **secure service communication**, **persistent data storage**, and **developer accessibility** through Docker Compose.

---

### 🧱 Architecture Summary

| Component | Role | Network(s) | Exposed Ports | Persistence |
|------------|------|-------------|----------------|--------------|
| **login** | Web server (frontend, NGINX) | `mynet1`, `mynet2` | `100:80` | `login_data:/usr/local/apache2` |
| **db** | Database service (MySQL) | `mynet2` | `3306:3306` | `db_data:/var/lib/mysql` |

Both containers are deployed on private **custom bridge networks** to enable **name-based service discovery** and internal communication without exposing the database externally.  
The `login` container (NGINX) acts as a **bridge** between both networks, handling traffic from the frontend and backend securely.

---

### 🎯 Key Objectives

- **Service Connectivity:**  
  Ensure that NGINX (`login`) and MySQL (`db`) can communicate over the internal Docker network `mynet2` using service names instead of IP addresses.

- **Data Persistence:**  
  Maintain database and web data across container restarts using **Docker volumes** (`login_data` and `db_data`).

- **Frontend Access:**  
  Expose the NGINX service on local port **100** so developers can access it via [http://localhost:100](http://localhost:100).

---

### 🌐 Network Design

- **`mynet1`** → Public-facing network for external access to the NGINX container.  
- **`mynet2`** → Internal-only network for secure communication between NGINX and MySQL.  
  - Marked as `internal: true` to restrict outside access.  

The **multi-homed architecture** ensures separation between public traffic and internal data operations.

---

### 💾 Data Persistence

- `login_data` → Stores NGINX configuration or static assets.  
- `db_data` → Persists MySQL data at `/var/lib/mysql`.  

Even if containers are removed or recreated, the volumes ensure that your data remains safe and accessible.

---

### 🧪 Verification Steps

1. **Deploy the Stack**
   ```bash
   docker compose up -d
   ```
2. Access the NGINX Web Server
- Visit http://localhost:100
  
  <img width="887" height="292" alt="image" src="https://github.com/user-attachments/assets/4f9dd089-f8ba-48b2-8e91-e360114d8076" />
  
> You should see the default NGINX welcome page.

3. Test Network Connectivity
  - Access the NGINX container:
    ` docker exec -it login bash`
  - Update and install network utilities:
    `apt update && apt install iputils-ping -y`
  - Ping the database container by name:
    `ping db`
>If you receive successful responses, the network connectivity inside `mynet2` is functioning properly.
