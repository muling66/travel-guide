#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git init
fi

git config user.name "mumu"
git config user.email "mumu@example.com"

git add .
git commit -m "Publish travel guide" >/dev/null 2>&1 || true

if command -v gh >/dev/null 2>&1; then
  if gh auth status >/dev/null 2>&1; then
    if [ $# -gt 0 ]; then
      REPO_URL="$1"
    else
      echo "请输入 GitHub 仓库地址，例如：https://github.com/你的用户名/你的仓库名.git"
      exit 1
    fi
    git remote remove origin >/dev/null 2>&1 || true
    git remote add origin "$REPO_URL"
    git branch -M main
    git push -u origin main
    echo "已推送到 GitHub。"
    exit 0
  fi
fi

echo "当前环境没有可用的 GitHub 授权。"
echo "请先在 GitHub 上创建仓库，然后执行："
echo "  git remote add origin https://github.com/你的用户名/你的仓库名.git"
echo "  git branch -M main"
echo "  git push -u origin main"
