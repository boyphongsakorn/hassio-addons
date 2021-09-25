#!/usr/bin/with-contenv bashio

echo $(bashio::config 'credential_file_content') > /etc/cloudflared/credentials.json
echo $(bashio::config 'config_file_content_base64') | base64 -d > /etc/cloudflared/config.yml

bashio::log.info "Running cloudflare tunnel..."

cloudflared tunnel --config /etc/cloudflared/config.yml run

cloudflared access tcp --hostname mcserver.pwisetthon.com --url 192.168.31.210:25565
