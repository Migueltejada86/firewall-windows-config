<#
    Script: firewall_config_migue_advanced.ps1
    Autor: elmigue.dev
    Descripción:
        - Configura Windows Firewall con reglas seguras
        - Permite apps de desarrollo (VSCode, MySQL, WAMP, VMware, Discord)
        - Bloquea puertos riesgosos (como 12345)
        - Activa logs y perfiles de seguridad

    Uso:
        Ejecutar como administrador
#>

Write-Host "🔧 Aplicando configuración avanzada de firewall..." -ForegroundColor Cyan

# Activar firewall en todos los perfiles
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True

# Política segura: bloquear entrada, permitir salida
Set-NetFirewallProfile -Profile Domain,Private,Public -DefaultInboundAction Block
Set-NetFirewallProfile -Profile Domain,Private,Public -DefaultOutboundAction Allow

# Permitir reglas locales de apps (útil para WAMP, VMware, etc.)
Set-NetFirewallProfile -Profile Domain,Private,Public -AllowInboundRules True
Set-NetFirewallProfile -Profile Domain,Private,Public -AllowLocalFirewallRules True

# Activar logs de tráfico bloqueado
Set-NetFirewallProfile -Profile Domain,Private,Public -LogBlocked True
Set-NetFirewallProfile -Profile Domain,Private,Public -LogAllowed False
Set-NetFirewallProfile -Profile Domain,Private,Public -LogMaxSizeKilobytes 8192

# Bloquear puerto histórico usado por troyanos
New-NetFirewallRule -DisplayName "Bloquear puerto 12345" -Direction Inbound -LocalPort 12345 -Protocol TCP -Action Block

# 🐬 MySQL (Puerto 3306) - Permitir solo en localhost
New-NetFirewallRule -DisplayName "Permitir MySQL en localhost" -Direction Inbound -LocalPort 3306 -Protocol TCP -Action Allow -LocalAddress 127.0.0.1

# 🌐 WampServer (Apache) - Puerto 80 y 443 - Permitir solo en red privada
New-NetFirewallRule -DisplayName "Permitir WAMP Apache en red privada" -Direction Inbound -LocalPort 80,443 -Protocol TCP -Action Allow -Profile Private

# 🖥️ VMware - Permitir puertos solo en red privada (ajustable)
New-NetFirewallRule -DisplayName "Permitir VMware en red privada" -Direction Inbound -LocalPort 902,912,2179 -Protocol TCP -Action Allow -Profile Private

# 🔄 Discord - no requiere reglas porque solo usa tráfico saliente

Write-Host "✅ Configuración de firewall avanzada aplicada correctamente." -ForegroundColor Green
