## 🌐 Project Overview — Multi-Homed NGINX Load Balancer Setup

This project demonstrates a **multi-homed container architecture** in Docker, where a single **NGINX Load Balancer** acts as a bridge between two **isolated custom bridge networks** — one handling client-side traffic (**Frontend**) and the other handling internal backend communication (**Backend**).  
This design ensures **strict network isolation**, **secure routing**, and **controlled service discovery**.

---

### 🧱 Architecture Summary

| Component | Role | Connected Network(s) | IP Allocation | Accessibility |
|------------|------|----------------------|----------------|----------------|
| **nginx-lb** | Load Balancer (bridge between frontend & backend) | `frontend-net`, `backend-net` | Dual IPs (10.1.1.x / 10.1.2.x) | Accessible on both networks |
| **client-tester** | Simulated client service | `frontend-net` | Single IP (10.1.1.x) | Frontend-only access |
| **backend-db** | Internal backend service | `backend-net` | Single IP (10.1.2.x) | Backend-only access |

---

### 🎯 Key Objectives
- **Network Isolation:** Create two separate Docker bridge networks to segregate client and backend communication.  
- **Multi-Homing:** Deploy the `nginx-lb` container connected to both networks simultaneously.  
- **Controlled Connectivity:** Ensure only the load balancer can access both networks, while frontend and backend remain isolated.

---

### ✅ Expected Outcome
- The `nginx-lb` container successfully acquires **two IP addresses** — one from each network.  
- A **ping from `client-tester` to `backend-db` fails**, confirming proper isolation.  
- A **ping from `nginx-lb` to `backend-db` succeeds**, validating the load balancer’s bridging role.

### ⚙️ How to Run
#### 1. Create the Custom Networks
```bash
docker network create --driver bridge --subnet 10.1.1.0/24 frontend-net
docker network create --driver bridge --subnet 10.1.2.0/24 --internal backend-net
```
<img width="495" height="128" alt="image" src="https://github.com/user-attachments/assets/3e68b5d2-98bb-425e-8918-1c6f001939e8" />

#### 2. Deploy the Backend and Client Containers
```bash
docker run -d -ti --name backend-db --network backend-net alpine:latest
docker run -d -ti --name client-tester --network frontend-net alpine:latest 
```
#### 3. Deploy the Multi-Homed NGINX Load Balancer
```bash
docker run -d --name nginx-lb --network frontend-net nginx:latest
docker network connect backend-net nginx-lb
```
#### 4. Deploy the Multi-Homed NGINX Load Balancer
<img width="639" height="594" alt="image" src="https://github.com/user-attachments/assets/60019231-0f39-4ea1-9e86-5f93b15be9cf" />

>  You should see two IPs — one from 10.1.1.x and another from 10.1.2.x.

#### 5. Test Network Isolation
Let’s verify that our network segmentation works as expected.
1. Access the client container (frontend side):

     `docker exec -ti client-tester sh`
 
2. Install the ping utility inside Alpine (if not already available): 

    `apk update && apk add iputils`

> Note: Alpine images are minimal by design — installing `iputils` adds the `ping` command.

3. Attempt to ping the backend service by its container name:
    `ping backend-db`

> ❌ Expected Result: The ping should fail, confirming that there’s no direct route between `frontend-net` and `backend-net`.
<img width="495" height="63" alt="image" src="https://github.com/user-attachments/assets/a0bc9aa5-9100-4709-afd1-c8921e3ceea3" />

4. Validate Load Balancer Connectivity (NGINX load balancer can access both networks)
```bash
apt apdate && apt install iputils-ping
ping backend-db
client-tester
```
> ✅Expected Result: The ping succeeds, verifying that nginx-lb can bridge communication between `frontend` and `backend` networks.

<img width="574" height="111" alt="image" src="https://github.com/user-attachments/assets/1af0393a-477d-40e2-b9c9-7a12a76edff8" />

### 🏁 Conclusion

This project successfully demonstrates how Docker’s custom bridge networks can be used to enforce network isolation while still enabling controlled communication through a multi-homed load balancer.
By designing a setup where nginx-lb bridges the frontend-net and backend-net, we achieve a secure, modular, and scalable microservice-like architecture — a fundamental pattern for real-world containerized deployments.

### 👨‍💻 Author
Omar Hassan.
- DevOps Engineer
- 📍 Passionate about automation, containerization, and cloud-native architectures.
- 🔗 [GitHub]: [Omarh4700](https://github.com/Omarh4700)
