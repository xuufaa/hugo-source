#!/bin/bash
# 用法：./new_daily_note.sh 学科 老师
SUBJECT=$1
TEACHER=$2
DATE=$(date +%F)
DIR="content/posts/$(date +%Y)/$SUBJECT/$TEACHER"
FILE="$DIR/$DATE.md"
mkdir -p "$DIR"

cat > "$FILE" <<EOF
---
title: "$DATE"
date: $DATE
draft: false
categories: ["$SUBJECT"]
tags: ["$SUBJECT | $TEACHER"]
---

# $SUBJECT · $TEACHER · $DATE

开始写你的学习笔记吧……
EOF

echo "已创建：$FILE"
