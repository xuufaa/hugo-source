---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: false
categories: ["{{ .File.Dir | replace "posts/" "" | replace "/" "" }}"]
tags: ["{{ .File.Dir | replace "posts/" "" | replace "/" " | " }}"]
---

# {{ replace .Name "-" " " | title }}

开始写你的学习笔记吧……
