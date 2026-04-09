#!/bin/bash

# Instala Oracle VirtualBox 7.0 en Ubuntu de forma segura y completa

set -e  # Detener el script ante errores

echo "🔄 Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

echo "📦 Instalando dependencias necesarias (gcc, dkms, headers)..."
sudo apt install -y gcc make perl dkms linux-headers-$(uname -r) wget gpg

echo "🔑 Añadiendo clave GPG oficial de Oracle..."
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | \
    sudo gpg --dearmor -o /usr/share/keyrings/oracle-virtualbox.gpg

echo "📁 Añadiendo repositorio oficial de VirtualBox..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | \
    sudo tee /etc/apt/sources.list.d/virtualbox.list > /dev/null

echo "🔄 Actualizando repositorios..."
sudo apt update

echo "⬇️ Instalando VirtualBox 7.0..."
sudo apt install -y virtualbox-7.0

echo "✅ Verificando instalación..."
virtualbox --help | head -n 1

echo "🎉 VirtualBox se ha instalado correctamente."

# Pregunta opcional para instalar el Extension Pack
read -p "¿Quieres instalar el Extension Pack oficial (USB 3.0, RDP, etc.)? [s/N]: " respuesta

if [[ "$respuesta" =~ ^[Ss]$ ]]; then
    echo "⬇️ Descargando Extension Pack de VirtualBox..."
    wget https://download.virtualbox.org/virtualbox/7.0.18/Oracle_VM_VirtualBox_Extension_Pack-7.0.18.vbox-extpack

    echo "🛠 Instalando Extension Pack..."
    sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.18.vbox-extpack

    echo "🧹 Limpiando archivo..."
    rm Oracle_VM_VirtualBox_Extension_Pack-7.0.18.vbox-extpack

    echo "✅ Extension Pack instalado correctamente."
fi

echo "✅ Todo listo. Puedes iniciar VirtualBox desde el menú o con el comando 'virtualbox'"
