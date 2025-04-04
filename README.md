# 🛡 Configuración de Firewall para Windows con PowerShell

> 🔧 Script de automatización para fortalecer la seguridad de Windows Defender Firewall sin interferir con entornos de desarrollo como VSCode, MySQL, WampServer, VMware y Discord.

---

## 📌 ¿Qué hace este script?

- Activa el firewall en los perfiles **Dominio**, **Privado** y **Público**.
- Aplica políticas seguras:
  - Bloquea todas las conexiones de entrada por defecto.
  - Permite todas las conexiones salientes.
- Activa el **registro de tráfico bloqueado**.
- Permite el uso normal de:
  - **Visual Studio Code**
  - **MySQL** (solo en localhost)
  - **WampServer** (solo en red privada)
  - **VMware** (puertos esenciales solo en red privada)
  - **Discord** (usa solo tráfico saliente)
- Bloquea manualmente el **puerto 12345**, comúnmente utilizado por troyanos.

---

## ⚙️ Cómo usarlo

1. Descargá el archivo `firewall_config_migue_advanced.ps1`
2. Hacé clic derecho → **Ejecutar con PowerShell (como administrador)**
3. Si PowerShell bloquea el script, habilitá la ejecución temporal con:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## 🔐 Seguridad personalizada

Podés adaptar el script para:

- Agregar o quitar puertos según tu entorno
- Aplicar políticas distintas para redes públicas vs privadas
- Loguear paquetes permitidos (opcional)
- Automatizar backups del estado del firewall

---

## 🧠 Autor

Desarrollado por [elmigue.dev](https://github.com/Migueltejada86)  
🌐 Seguridad básica para desarrolladores de escritorio

---

## 📄 Licencia

MIT
