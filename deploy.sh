#!/usr/bin/env bash
# Frank Consulting - 一键发布到 GitHub Pages
# 用法:
#   1. 打开终端, cd 到这个目录
#   2. 修改下面的 GITHUB_USER 和 REPO_NAME
#   3. 运行: bash deploy.sh

set -e

# ====== 请改成你的信息 ======
GITHUB_USER="your-github-username"          # 你的 GitHub 用户名
REPO_NAME="frank-consulting"                # 你的仓库名 (没有就先在 github.com/new 创建一个空仓库)
GIT_USER_NAME="Frank Wang"                  # commit 显示的作者名
GIT_USER_EMAIL="wbi@nvidia.com"             # commit 显示的邮箱
# =========================

cd "$(dirname "$0")"

# 清理可能残留的 git 锁
rm -f .git/HEAD.lock .git/index.lock 2>/dev/null || true

# 设置作者信息 (只在本仓库内生效)
git config user.name  "$GIT_USER_NAME"
git config user.email "$GIT_USER_EMAIL"

# 切到 main 分支 (GitHub 默认)
git branch -M main

# 提交所有改动
git add -A
if ! git diff --cached --quiet; then
  git commit -m "Update: customer archive with ABC list scoring + bilingual landing"
else
  echo "✓ 没有新改动需要提交"
fi

# 配置远端
REMOTE_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REMOTE_URL"
else
  git remote add origin "$REMOTE_URL"
fi

echo ""
echo "→ 正在 push 到 $REMOTE_URL"
echo "  如果提示输入密码: GitHub 已不支持密码,请使用 Personal Access Token (PAT)"
echo "  生成 PAT: https://github.com/settings/tokens?type=beta"
echo ""

git push -u origin main

echo ""
echo "✅ 部署完成!"
echo ""
echo "现在去仓库设置启用 GitHub Pages:"
echo "  https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
echo "  Source: Deploy from a branch"
echo "  Branch: main / (root)"
echo ""
echo "稍等 1-2 分钟后,网站访问地址:"
echo "  https://${GITHUB_USER}.github.io/${REPO_NAME}/"
echo "  客户档案: https://${GITHUB_USER}.github.io/${REPO_NAME}/customer-archive.html"
