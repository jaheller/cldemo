# Demo IP Addressing

All demos should use these IP assignments, the same as the [Cumulus CL101](https://support.cumulusnetworks.com/hc/en-us/articles/201956333-Cumulus-Linux-101) lab guide.

## Management network

**Subnet** 192.168.0.0/24

**DHCP pool** 192.168.0.100 - 192.168.0.200

| Device  | Interface | IPv4           | Type             |
|---------|-----------|----------------|------------------|
| wbench  | eth1      | 192.168.0.1    | Static           |
| server1 | IPMI      | 192.168.0.3    | Static           |
| server2 | IPMI      | 192.168.0.4    | Static           |
| leaf1   | eth1      | 192.168.0.11   | DHCP Reservation |
| spine1  | eth1      | 192.168.0.12   | DHCP Reservation |
| leaf2   | eth1      | 192.168.0.13   | DHCP Reservation |
| spine2  | eth1      | 192.168.0.14   | DHCP Reservation |
| server1 | eth0      | 192.168.0.201  | DHCP Reservation |
| server2 | eth0      | 192.168.0.201  | DHCP Reservation |



## Loopbacks

All /32's or /128's

| Device  | Interface | IPv4           | IPv6             |
|---------|-----------|----------------|------------------|
| leaf1   | lo        | 10.2.1.1       |                  |
| leaf2   | lo        | 10.2.1.2       |                  |
| spine1  | lo        | 10.2.1.3       |                  |
| spine2  | lo        | 10.2.1.4       |                  |

## Client bridges / VLANs

| Device  | Interface | IPv4           | IPv6             |
|---------|-----------|----------------|------------------|
| leaf1   | br0       | 10.4.1.0/25    |                  |
| leaf2   | br1       | 10.4.1.128/25  |                  |
| leaf1   | br0       | 10.4.2.0/25    |                  |
| leaf2   | br1       | 10.4.2.128/25  |                  |

## Point to points / linknets

| Topology | IPv4 subnet  | IPv6 subnet | Device A | Device B | Interface A | Interface B | IPv4 A    | IPv4 B    | IPv6 A | IPv6 B |
|----------|--------------|-------------|----------|----------|-------------|-------------|-----------|-----------|--------|--------|
| 2s       | 10.1.1.0/30  |             | leaf1    | leaf2    | swp1        | swp1        | 10.1.1.1  | 10.1.1.2  |        |        |
| 2s       | 10.1.1.4/30  |             | leaf1    | leaf2    | swp2        | swp2        | 10.1.1.5  | 10.1.1.6  |        |        |
| 2s       | 10.1.1.8/30  |             | leaf1    | leaf2    | swp3        | swp3        | 10.1.1.9  | 10.1.1.10 |        |        |
| 2s       | 10.1.1.12/30 |             | leaf1    | leaf2    | swp4        | swp4        | 10.1.1.13 | 10.1.1.14 |        |        |
| 2s2l     | 10.1.1.0/30  |             | leaf1    | spine1   | swp1        | swp1        | 10.1.1.1  | 10.1.1.2  |        |        |
| 2s2l     | 10.1.1.4/30  |             | leaf1    | spine1   | swp2        | swp2        | 10.1.1.5  | 10.1.1.6  |        |        |
| 2s2l     | 10.1.1.8/30  |             | leaf1    | spine1   | swp3        | swp3        | 10.1.1.9  | 10.1.1.10 |        |        |
| 2s2l     | 10.1.1.12/30 |             | leaf1    | spine1   | swp4        | swp4        | 10.1.1.13 | 10.1.1.14 |        |        |
| 2s2l     | 10.1.1.16/30 |             | leaf2    | spine2   | swp1        | swp1        | 10.1.1.17 | 10.1.1.18 |        |        |
| 2s2l     | 10.1.1.20/30 |             | leaf2    | spine2   | swp2        | swp2        | 10.1.1.21 | 10.1.1.22 |        |        |
| 2s2l     | 10.1.1.24/30 |             | leaf2    | spine2   | swp3        | swp3        | 10.1.1.25 | 10.1.1.26 |        |        |
| 2s2l     | 10.1.1.28/30 |             | leaf2    | spine2   | swp4        | swp4        | 10.1.1.29 | 10.1.1.30 |        |        |
| 2s2l     | 10.1.1.32/30 |             | leaf1    | spine2   | swp17       | swp17       | 10.1.1.33 | 10.1.1.34 |        |        |
| 2s2l     | 10.1.1.36/30 |             | leaf1    | spine2   | swp18       | swp18       | 10.1.1.37 | 10.1.1.38 |        |        |
| 2s2l     | 10.1.1.40/30 |             | leaf1    | spine2   | swp19       | swp19       | 10.1.1.41 | 10.1.1.42 |        |        |
| 2s2l     | 10.1.1.44/30 |             | leaf1    | spine2   | swp20       | swp20       | 10.1.1.45 | 10.1.1.46 |        |        |
| 2s2l     | 10.1.1.48/30 |             | leaf2    | spine1   | swp17       | swp17       | 10.1.1.49 | 10.1.1.50 |        |        |
| 2s2l     | 10.1.1.52/30 |             | leaf2    | spine1   | swp18       | swp18       | 10.1.1.53 | 10.1.1.54 |        |        |
| 2s2l     | 10.1.1.56/30 |             | leaf2    | spine1   | swp19       | swp19       | 10.1.1.57 | 10.1.1.58 |        |        |
| 2s2l     | 10.1.1.60/30 |             | leaf2    | spine1   | swp20       | swp20       | 10.1.1.61 | 10.1.1.62 |        |        |

## Overlays

| Topology | IPv4 subnet  | IPv6 subnet | Device A | Device B | Interface A | Interface B | IPv4 A    | IPv4 B    | IPv6 A | IPv6 B |
|----------|--------------|-------------|----------|----------|-------------|-------------|-----------|-----------|--------|--------|
| VXLAN demo| 172.16.0.0/25|             | server1  | server2  | ethX        | ethX        | 172.16.0.1| 172.16.0.2|        |        |





