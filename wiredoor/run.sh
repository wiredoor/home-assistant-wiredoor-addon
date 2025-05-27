#!/usr/bin/with-contenv bashio
set -e

TOKEN=$(jq -r '.token' /data/options.json)
WIREDOOR_URL=$(jq -r '.url' /data/options.json)

if [[ -z "$TOKEN" || "$TOKEN" == "null" ]]; then
  echo "[ERROR] TOKEN is not set. Please define it in the add-on options."
  exit 1
fi

if [[ -z "$WIREDOOR_URL" || "$WIREDOOR_URL" == "null" ]]; then
  echo "[ERROR] WIREDOOR_URL is not set. Please define it in the add-on options."
  exit 1
fi

dnsmasq --server=127.0.0.11 --listen-address=0.0.0.0 --bind-interfaces

echo "Connecting to ${WIREDOOR_URL}..."

/usr/bin/wiredoor connect --url="${WIREDOOR_URL}" --token="${TOKEN}"

/usr/bin/wiredoor status --watch --interval=10
