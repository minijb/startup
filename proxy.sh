# 代理配置
export CLASH_PORT=7897

proxy_on() {
    export WSL_HOST=$(ip route | grep default | awk '{print $3}')
    export http_proxy="http://${WSL_HOST}:${CLASH_PORT}"
    export https_proxy="http://${WSL_HOST}:${CLASH_PORT}"
    export all_proxy="socks5://${WSL_HOST}:${CLASH_PORT}"
    export no_proxy="localhost,127.0.0.1,::1"
    echo -e "\033[32m✓ Proxy enabled: $http_proxy\033[0m"
}

proxy_off() {
    unset http_proxy
    unset https_proxy
    unset all_proxy
    unset no_proxy
    echo -e "\033[31m✗ Proxy disabled\033[0m"
}

proxy_status() {
    if [ -n "$http_proxy" ]; then
        echo -e "\033[32m✓ Proxy is enabled: $http_proxy\033[0m"
        echo "Testing connection..."
        curl -I -s --connect-timeout 3 https://www.google.com | head -n 1
    else
        echo -e "\033[31m✗ Proxy is disabled\033[0m"
    fi
}

# 别名
alias pon='proxy_on'
alias poff='proxy_off'
alias pst='proxy_status'

# 自动启用代理（可选）
# proxy_on

