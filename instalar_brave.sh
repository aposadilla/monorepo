#!/bin/bash

set -e
echo "📦 Instalando dependencias..."
sudo apt install -y curl apt-transport-https

echo "🔑 Descargando archivo archive-keyring.gpg oficial..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
  https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "📁 Añadiendo repositorio de Brave..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] \
https://brave-browser-apt-release.s3.brave.com/ stable main" | \
sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null

echo "🔄 Actualizando repositorios..."
sudo apt update

echo "⬇️ Instalando Brave Browser..."
sudo apt install -y brave-browser

echo "✅ Brave instalado: $(brave-browser --version)"

