# Proyecto DHCP con Vagrant

Este proyecto implementa un **servidor DHCP** y **dos clientes** utilizando **Vagrant** y un script de **provisionamiento automático** en **Bash**.  
El objetivo es simular una red local donde el servidor asigna direcciones IP dinámicas a los clientes mediante DHCP.

---

## 🧱 Estructura del proyecto

```
.
├── Vagrantfile
├── provision_servidor.sh
├── .gitignore
└── vendor/
```

- **Vagrantfile** → Define las 3 máquinas virtuales (1 servidor y 2 clientes) y su red interna.  
- **provision_servidor.sh** → Instala y configura automáticamente el servicio DHCP en el servidor.  
- **vendor/** → Carpeta auxiliar (si la usas para dependencias o scripts).  
- **.gitignore** → Archivos ignorados por Git.

---

## ⚙️ Requisitos previos

Antes de iniciar el proyecto asegúrate de tener instalado:

- [Vagrant](https://developer.hashicorp.com/vagrant/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Conexión a internet para descargar las imágenes base

---

## 🚀 Puesta en marcha

1. **Clonar el repositorio:**

   ```bash
   git clone https://github.com/DavidHlanz/DHCP-Proyecto.git
   cd DHCP-Proyecto
   ```

2. **Levantar las máquinas virtuales:**

   ```bash
   vagrant up
   ```

   Esto creará:
   - `servidor` → Servidor DHCP configurado automáticamente  
   - `cliente1` y `cliente2` → Clientes que obtienen IP mediante DHCP  

3. **Verificar la configuración:**

   Conéctate a un cliente y ejecuta:

   ```bash
   vagrant ssh cliente1
   ip a
   ```

   Verás una dirección IP obtenida del rango definido en el servidor DHCP.

---

## 🧩 Configuración DHCP

El archivo `provision_servidor.sh` realiza:

- Instalación del paquete DHCP (`isc-dhcp-server`)
- Configuración de `/etc/dhcp/dhcpd.conf` con:
  - Rango de IPs
  - Máscara de red
  - Puerta de enlace
  - Servidor DNS
- Activación y reinicio del servicio DHCP

Puedes modificar el rango o parámetros dentro del script según tus necesidades.

---

## 🔁 Comandos útiles

- **Reiniciar el entorno:**
  ```bash
  vagrant reload
  ```

- **Reprovisionar (si cambiaste el script):**
  ```bash
  vagrant provision servidor
  ```

- **Eliminar todas las máquinas:**
  ```bash
  vagrant destroy -f
  ```

---

## 🧠 Conceptos prácticos que se pueden probar

- Capturar paquetes DHCP con Wireshark.
- Probar conflictos de IP.
- Añadir un segundo servidor DHCP y probar tolerancia.
- Configurar reservas IP para MACs específicas.

---

## 📜 Licencia

Proyecto educativo sin licencia específica.  
Puedes reutilizarlo y adaptarlo libremente con fines académicos o de práctica.
