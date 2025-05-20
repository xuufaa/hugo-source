#!/bin/bash

# ✍️ 中文 Hugo 博客快速写作脚本
# 用法: ./blog.sh 新建 分类 子分类 文章标题
# 示例: ./blog.sh 新建 刑法 路遥 "2025年5月20日笔记"

set -e

ACTION=$1
CATEGORY=$2
SUBCATEGORY=$3
TITLE=$4

# 获取当前日期和时间
DATE=$(date "+%Y-%m-%d")
DATETIME=$(date "+%Y-%m-%dT%H:%M:%S%z")
FILENAME="${DATE}-${TITLE// /_}.md"

# 如果是新建操作
if [[ "$ACTION" == "新建" ]]; then
  # 创建目录
  DIR="content/posts/${CATEGORY}/${SUBCATEGORY}"
  mkdir -p "$DIR"

  # 创建 Markdown 文件
  FILEPATH="$DIR/$FILENAME"
  cat > "$FILEPATH" <<EOF
---
title: "$TITLE"
date: $DATETIME
categories: ["$CATEGORY"]
tags: ["$SUBCATEGORY"]
draft: false
---

# $TITLE

记录人：$SUBCATEGORY老师  
记录时间：$DATE  

EOF

  echo "✅ 文章已创建：$FILEPATH"
  
  # 使用 vi 打开文章
  vi "$FILEPATH"
else
  echo "❌ 用法错误。请使用示例：./blog.sh 新建 刑法 路遥 \"2025年5月20日笔记\""
fi
