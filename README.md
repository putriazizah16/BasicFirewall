# Basic Firewall
The purpose of this project is to create a simple network configuration that prohibits 2 VPCS and allow 1 VPCS getting the internet connection.

<img width="632" height="467" alt="image" src="https://github.com/user-attachments/assets/0a06731f-a616-4c58-85c6-eb33ca7c4cea" />

Here are the platforms and virtual device that I use:
- Linux Ubuntu 24.04.3
- GNS3 2.2.55
- Mikrotik CHR 7.20.5

## Steps
**1. Configure the router and VPCS**

I use Mikrotik router that is connected to Cloud (internet connection) and 3 VPCS through a switch. The router acts as DHCP server to the VPCS.

**2. Configure the Firewall filter**

I follow the tutorial from [Mikrotik Documentation](https://help.mikrotik.com/docs/spaces/ROS/pages/48660574/Filter).
- Accepting known and accepted connection.
> /ip firewall filter add action=accept chain=input comment="default configuration" connection-state=established,related
- Create an address-list to be used for the firewall rules.
> /ip firewall address-list add address=192.168.2.99-192.168.2.100 list=PCLAN

I prohibit 2 VPCS (PC1 and PC2) from getting the internet connection and I allow 1 VPCS (PC3).

**3. Results**

PC1 and PC2 is prohibited, can't access internet.
<img width="813" height="620" alt="image" src="https://github.com/user-attachments/assets/1325e4df-b4c5-4292-9721-f54e28f99eb8" />
<img width="813" height="620" alt="image" src="https://github.com/user-attachments/assets/a970ff94-56fc-45e7-9941-e6efe2e0cfbf" />

P3 is allowed.
<img width="813" height="620" alt="image" src="https://github.com/user-attachments/assets/3c36fe6a-131e-4df4-a94e-d2b4711ec530" />

