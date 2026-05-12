#!/usr/bin/env bash
# Frank Consulting — 一键提交并 push 到 GitHub
# 用法: bash update.sh [可选的 commit 信息]

set -e
cd "$(dirname "$0")"

MSG="${1:-Update site}"

# 清理可能残留的 git 锁
rm -f .git/HEAD.lock .git/index.lock 2>/dev/null || true

git add -A

if git diff --cached --quiet; then
  echo "✓ 没有改动需要提交"
  exit 0
fi

git commit -m "$MSG"
git push origin main

echo ""
echo "✅ 已推送到 github.com/Wentaobi/frank-consulting"
echo "   稍等 1 分钟刷新: https://wentaobi.github.io/frank-consulting/"
