#!/bin/bash

# Instala Google Chrome Stable en Ubuntu de forma limpia y segura

set -e  # Detener el script si hay un error

echo "🔄 Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

echo "📦 Descargando paquete oficial de Google Chrome..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "🛠 Instalando Google Chrome con apt..."
sudo apt install -y ./google-chrome-stable_current_amd64.deb

echo "🧹 Limpiando archivos temporales..."
rm google-chrome-stable_current_amd64.deb

echo "✅ Verificando instalación..."
google-chrome --version

echo "📌 Google Chrome se ha instalado correctamente."
echo "🔁 Se actualizará automáticamente con el sistema."
