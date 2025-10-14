#Task2
🌐 Project Overview — Multi-Homed Container Architecture (NGINX Load Balancer)

This project demonstrates a multi-homed container setup in Docker, where a single service — an NGINX Load Balancer — is connected to two distinct and isolated custom bridge networks.
The goal is to segregate client traffic (frontend) from internal service communication (backend), ensuring network isolation while allowing controlled routing through the load balancer.

🧩 Architecture Summary
Component	Role	Connected Network(s)
nginx-lb	Load Balancer (bridge between networks)	frontend-net, backend-net
client-tester	Client Simulator	frontend-net
backend-db	Backend Service	backend-net
⚙️ Network Configuration

Frontend Network

Name: frontend-net

Subnet: 10.1.1.0/24

Backend Network

Name: backend-net

Subnet: 10.1.2.0/24

🔍 Key Objectives

Create two isolated Docker bridge networks for frontend and backend environments.

Deploy a multi-homed NGINX container (nginx-lb) connected to both networks.

Validate network isolation and routing through the load balancer.

Ensure service discovery using container names instead of IPs.

✅ Expected Outcome

The nginx-lb container acquires two IP addresses — one from each subnet (10.1.1.x and 10.1.2.x).

The ping test from client-tester to backend-db fails, confirming strict isolation between frontend and backend networks.

The ping test from nginx-lb to backend-db succeeds, validating controlled communication through the multi-homed container.
