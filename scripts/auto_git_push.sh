#!/bin/bash
cd "$(dirname "$0")/.."
DATE=$(date +%F)
git add .
git commit -m "update notes for $DATE"
git push
