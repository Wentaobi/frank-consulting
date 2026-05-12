#!/usr/bin/env bash
# 此文件已废弃 - GitHub 集成已配置完成,改用 update.sh
echo "deploy.sh 已废弃,请运行: bash update.sh"
exec bash "$(dirname "$0")/update.sh" "$@"
