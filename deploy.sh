#!/bin/bash

# xuufaa 的 Hugo 博客一键部署脚本

set -e

echo "🧹 生成静态网站..."
hugo

echo "✍️ 写入 CNAME 为 208128.xyz"
echo "208128.xyz" > public/CNAME

cd public

echo "🚀 初始化 Git 并配置远程仓库..."
git init

# ✅ 先移除已有的 origin（如果存在）
git remote remove origin 2> /dev/null || true

# ✅ 添加新的远程地址
git remote add origin https://github.com/xuufaa/xuufaa.github.io

git add .
git commit -m "自动部署博客：$(date '+%Y-%m-%d %H:%M:%S')"
git branch -M main
git push -f origin main

echo "✅ 部署成功！请访问：https://208128.xyz"
