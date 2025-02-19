#!/bin/bash
# 配置
IP=192.168.1.100
PORT=7890

# 备份
OLD_HTTP=$http_proxy
OLD_HTTPS=$https_proxy
OLD_ALL=$all_proxy

# 代理
export http_proxy=http://$IP:$PORT
export https_proxy=http://$IP:$PORT
export all_proxy=socks5://$IP:$PORT

# 测试
test() {
  curl -s --head --connect-timeout 5 "$1" >/dev/null && echo "OK: $1" || echo "Fail: $1"
}

test https://www.google.com
test https://www.github.com

# 回滚
export http_proxy=$OLD_HTTP
export https_proxy=$OLD_HTTPS
export all_proxy=$OLD_ALL

