#!/bin/bash

# Desinstala VirtualBox y limpia todos los archivos relacionados

set -e  # Detener el script ante cualquier error

echo "🧹 Desinstalando VirtualBox y módulos relacionados..."
sudo apt purge -y virtualbox* dkms

echo "🗂️ Eliminando repositorio de Oracle..."
sudo rm -f /etc/apt/sources.list.d/virtualbox.list

echo "🔐 Eliminando clave GPG de Oracle..."
sudo rm -f /usr/share/keyrings/oracle-virtualbox.gpg

echo "🔄 Actualizando lista de paquetes..."
sudo apt update

echo "🗑️ Eliminando posibles archivos residuales..."
sudo rm -rf ~/.config/VirtualBox
sudo rm -rf ~/.VirtualBox
sudo rm -rf /etc/vbox /var/lib/vbox

echo "📁 Verificando si hay Extension Pack instalado..."
if VBoxManage list extpacks 2>/dev/null | grep -q "Extension Packs"; then
    echo "🔧 Desinstalando Extension Pack..."
    sudo VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"
fi

echo "👥 Eliminando grupo vboxusers (si existe)..."
if getent group vboxusers > /dev/null; then
    sudo delgroup vboxusers
fi

echo "✅ VirtualBox ha sido completamente desinstalado del sistema."
