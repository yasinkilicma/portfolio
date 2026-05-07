#!/bin/bash

# GitHub Push Script for Portfolio
# Usage: Edit this file, paste your token where it says "YOUR_TOKEN_HERE", then run: bash push-to-github.sh

echo "================================"
echo "GitHub Portfolio Push Script"
echo "================================"

# Kullanıcı bilgileri
GITHUB_USER="yasinkilicma"
REPO_NAME="portfolio"
TOKEN="YOUR_TOKEN_HERE"  # <-- BURAYA TOKEN'INI YAPIŞTIR

# Token kontrolü
if [ "$TOKEN" = "YOUR_TOKEN_HERE" ]; then
    echo "❌ HATA: Lütfen dosyayı düzenleyip YOUR_TOKEN_HERE yazan yere kendi token'ını yapıştır!"
    exit 1
fi

# Portfolio klasörüne git
cd /Users/yasinkilic/portfolio

# Remote URL'i token ile güncelle
git remote set-url origin https://$TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git

# Push işlemi
echo "🚀 GitHub'a gönderiliyor..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ BAŞARILI! Kodlar GitHub'a gönderildi."
    echo "🌐 Repo adresi: https://github.com/$GITHUB_USER/$REPO_NAME"
    echo ""
    echo "📋 Sonraki adımlar:"
    echo "   1. GitHub'da repo'ya git"
    echo "   2. Settings → Pages sekmesine tıkla"
    echo "   3. Source: Deploy from a branch → Branch: main → /(root) seç"
    echo "   4. Save de ve 2-3 dakika bekle"
    echo "   5. Site bu adreste yayında olacak: https://$GITHUB_USER.github.io/$REPO_NAME"
else
    echo ""
    echo "❌ HATA oluştu. Lütfen yukarıdaki mesajı kontrol et."
fi
