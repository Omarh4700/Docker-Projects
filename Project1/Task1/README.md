# 🧩 HR App Network Setup

This project demonstrates how to build a **dedicated and isolated Docker network** for a Human Resources (HR) application stack.  
The setup ensures **service discovery via container names** and avoids **IP conflicts** with corporate VPN subnets by using a custom-defined network range.

---

## ⚙️ Network & Container Configuration

| Component | Role | Network | IP Range | Accessibility |
|------------|------|----------|-----------|----------------|
| **hr-app-net** | Custom Bridge Network | — | `192.168.20.0/24` | Internal only |
| **nginx-server** | Web Frontend | hr-app-net | DHCP (via Docker) | Accessible via container name |
| **alpine-tester** | Diagnostic / Client Tester | hr-app-net | DHCP (via Docker) | Used for testing connectivity |

---

## 🎯 Key Objectives

- 🧱 **Create and verify** a custom bridge network (`hr-app-net`) with a dedicated subnet and gateway.  
- 🚀 **Deploy containers** attached to the isolated network.  
- 🧩 **Validate IP allocation** for each container.  
- 🌐 **Test internal connectivity** using Docker’s built-in DNS for name-based service discovery.  

---

## 🧠 Steps to Reproduce

### 1- Create the Custom Bridge Network
`
docker network create --driver bridge --subnet=192.168.20.0/24 --gateway=192.168.20.1 hr-app-net
`
### 2- Verify Network Configuration
`
docker network inspect hr-app-net
`

<img width="578" height="485" alt="image" src="https://github.com/user-attachments/assets/b95d3ca6-4297-45e8-9434-31683a0b2ae7" />

> ✅ Confirm the subnet and gateway match the expected configuration.

### 3- Run the Containers
```bash
docker run -d --name nginx-server --network hr-app-net nginx
docker run -dit --name alpine-tester --network hr-app-net alpine
```
### 4- Check IP Allocation
```bash
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx-server
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' alpine-tester
```

> 🧩 Both containers should have IPs within the 192.168.20.x range.

### 5- Test Service Discovery
- Access the Alpine container:
  
  `
  docker exec -it alpine-tester sh
  `
- Update Alpine and install ping:
  
  `
  apk update && apk add iputils-ping
  `
- Test name-based connectivity:
  
  `
  ping nginx-server
  `
<img width="603" height="99" alt="image" src="https://github.com/user-attachments/assets/257b6697-1604-46e3-88a4-64a14d43c64d" />

> ✅ Expected: Successful ping response, confirming internal DNS and connectivity.

### 👨‍💻 Author
Omar Hassan.
- DevOps Engineer
- 📍 Passionate about automation, containerization, and cloud-native architectures.
- 🔗 [GitHub]: [Omarh4700](https://github.com/Omarh4700)
