#!/usr/bin/with-contenv bashio

mkdir -p /etc/cloudflared

echo $(bashio::config 'credential_file_content') > /etc/cloudflared/credentials.json
echo $(bashio::config 'config_file_content_base64') | base64 -d > /etc/cloudflared/config.yml
#echo $(bashio::config 'config_file_content') > /etc/cloudflared/config.yml

bashio::log.info "Running cloudflared update..."

#cloudflared update

wget -O /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/$CVERSION/cloudflared-linux-$ARCH && chmod +x /usr/local/bin/cloudflared

bashio::log.info "Running cloudflared tunnel..."

cloudflared tunnel --config /etc/cloudflared/config.yml --autoupdate-freq 1h run
