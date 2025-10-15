#Task1

This task demonstrates how to build a dedicated and isolated Docker network for a Human Resources (HR) application stack. The setup ensures service discovery via container names and avoids IP conflicts with existing VPN or corporate subnets by using a custom-defined network range.

The project provisions a Custom Bridge Network named hr-app-net with a dedicated subnet (192.168.20.0/24) and gateway (192.168.20.1). Within this network, two containers are deployed:

nginx-server — acts as the web frontend.

alpine-tester — used for connectivity and diagnostics testing.

Through this setup, both containers communicate using Docker’s internal DNS, enabling name-based service discovery without relying on static IPs.

🔍 Key Objectives

Create and verify a custom bridge network with a dedicated subnet.

Deploy containers attached to the isolated network.

Validate container IP allocation and inter-container communication.

Test successful name-based ping resolution (alpine-tester → nginx-server).

✅ Expected Outcome

Both containers receive IPs within the 192.168.20.0/24 subnet, and a successful ping test confirms internal connectivity and DNS-based service discovery within the isolated environment.
