# 🧩 DHCP and Vagrant Project  
**Authors:** David Ortiz & Javier Padial  
📦 [GitHub Repository](https://github.com/DavidHlanz/DHCP-Proyecto)

---

## 🧰 Requirements

### 1. VirtualBox  
Vagrant uses VirtualBox as its default hypervisor.

### 2. Vagrant  
Used to create and manage virtualized development environments.

### 3. Git (optional)  
You can download the project using Git or as a compressed ZIP file.

---

## ⚙️ Tutorial to Use

### 1. Clone the repository
```bash
git clone https://github.com/DavidHlanz/DHCP-Proyecto.git
```

### 2. Open the project folder
```bash
cd ~/Documentos/DHCP-Proyecto
```

### 3. Create a host-only network on 192.168.57.1/24  
- Open **VirtualBox → Preferences → Network → Host-only Networks**
- Create a new network with the following settings:
  - **IPv4:** `192.168.57.1`
  - **Subnet mask:** `255.255.255.0`
  - **DHCP server:** Disabled

### 4. Raise the machines
```bash
vagrant up
```
> Vagrant will download the box (this may take a while the first time), create the VMs, and apply your network configuration and provisioning automatically.  
> If it does not, use:
```bash
vagrant provision server
```

---

## ⚒️ Test Commands

| Action | Command |
|--------|----------|
| See machine status | `vagrant status` |
| Access the server machine | `vagrant ssh servidor` |
| Access client machines | `vagrant ssh c1` / `vagrant ssh c2` |
| Reload the server | `vagrant reload servidor` |
| Test the network | `ping 192.168.57.10`<br>`ip -a`<br>`cat /etc/resolv.conf` |
| Stop all machines | `vagrant halt` |
| Destroy all machines | `vagrant destroy -f` |

---

## ⚙️ Configuration

### Exercise requirements
- **Three machines:**
  - `servidor` → DHCP server  
  - `c1` → Client requesting dynamic IP  
  - `c2` → Client that must always receive a fixed IP according to its MAC  
- **Internal network:** `192.168.57.0/24`
- **Server IP:** `192.168.57.10`
- **DHCP Range:** `192.168.57.25 - 192.168.57.50`
- **Fixed IP:** `c2` must always receive `192.168.57.4`

---

### 1. Vagrantfile Configuration  
Contains the definitions of the server and the two clients.  
Once configured, start them with:
```bash
vagrant up servidor
vagrant up c1
vagrant up c2
```

---

### 2. Locate the Interface  
```bash
ip -a
nano /etc/default/isc-dhcpd-server
```

---

### 3. dhcpd.conf Configuration  
Define the DHCP server behavior, IP ranges, and MAC-based assignments.

---

### 4. Test IP Clients  
Verify that each client receives the correct IP address.

---

### 5. Review Logs  
Check system and DHCP logs to ensure the service is working properly.

---

### 6. View Leases  
Inspect the lease file to confirm IP assignments.

---

📘 **Authors:**  
David Ortiz Sierra & Javier Padial  
