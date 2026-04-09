#!/bin/bash

# Script para desinstalar Brave Browser completamente de Ubuntu

set -e

echo "🧹 Eliminando Brave Browser..."
sudo apt purge -y brave-browser

echo "📁 Eliminando repositorio de Brave..."
sudo rm -f /etc/apt/sources.list.d/brave-browser-release.list

echo "🔐 Eliminando clave GPG de Brave..."
sudo rm -f /usr/share/keyrings/brave-browser-archive-keyring.gpg

echo "🔄 Actualizando repositorios..."
sudo apt update

echo "🗂️ Eliminando configuraciones locales del usuario (no afecta otros usuarios)..."
rm -rf ~/.config/BraveSoftware
rm -rf ~/.cache/BraveSoftware
rm -rf ~/.local/share/BraveSoftware

echo "🧹 Eliminando posibles residuos adicionales (solo si existen)..."
sudo rm -rf /opt/brave.com

echo "✅ Brave ha sido completamente desinstalado del sistema."
