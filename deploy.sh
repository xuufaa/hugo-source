#!/bin/bash

# xuufaa 的 Hugo 博客 一键源码提交 + 静态部署 脚本
# 放在 hugo-source 根目录执行

set -e

echo "🔄 开始提交 Hugo 博客源码到 hugo-source..."

git add .
git commit -m "更新博客内容：$(date '+%Y-%m-%d %H:%M:%S')" || echo "📌 没有需要提交的源码更改。"
git push origin main

echo "🧹 开始生成静态网站..."
hugo
touch public/.nojekyll

echo "✍️ 写入 CNAME 为 blog.208128.xyz"
echo "blog.208128.xyz" > public/CNAME

cd public

echo "🚀 初始化部署 Git 仓库..."
git init
git remote remove origin 2> /dev/null || true
git remote add origin https://github.com/xuufaa/xuufaa.github.io

git add .
git commit -m "自动部署博客：$(date '+%Y-%m-%d %H:%M:%S')"
git branch -M main
git push -f origin main

echo ""
echo "✅ 部署成功！请访问：https://blog.208128.xyz"
