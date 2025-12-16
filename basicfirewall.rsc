# 2025-12-16 08:31:54 by RouterOS 7.20.5
# system id = Ck3MTSQzTZM
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/ip pool
add name=pool1 ranges=192.168.2.2-192.168.2.100
/ip dhcp-server
add address-pool=pool1 interface=ether2 name=dhcp
/port
set 0 name=serial0
/ip address
add address=192.168.1.2/24 interface=ether1 network=192.168.1.0
add address=192.168.2.1/24 interface=ether2 network=192.168.2.0
/ip dhcp-client
add interface=ether1
/ip dhcp-server network
add address=192.168.2.0/24 dns-server=8.8.8.8 gateway=192.168.2.1
/ip firewall address-list
add address=192.168.2.99-192.168.2.100 list=PCLAN
/ip firewall filter
add action=accept chain=input comment="default configuration" \
    connection-state=established,related
add action=drop chain=forward in-interface=ether2 src-address-list=PCLAN
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add gateway=192.168.1.1
/system identity
set name=R1
