#!/usr/bin/with-contenv bashio
set -euo pipefail

TOKEN="$(bashio::config 'token')"
WIREDOOR_URL="$(bashio::config 'url')"

if [[ -z "${TOKEN}" || "${TOKEN}" == "null" ]]; then
  bashio::log.error "TOKEN is not set. Please define it in the add-on options."
  exit 1
fi

if [[ -z "${WIREDOOR_URL}" || "${WIREDOOR_URL}" == "null" ]]; then
  bashio::log.error "WIREDOOR_URL is not set. Please define it in the add-on options."
  exit 1
fi

dnsmasq --server=127.0.0.11 --listen-address=0.0.0.0 --bind-interfaces

bashio::log.info "Connecting to ${WIREDOOR_URL}..."

/usr/bin/wiredoor connect --url="${WIREDOOR_URL}" --token="${TOKEN}"

/usr/bin/wiredoor status --watch --interval=10

bashio::log.info "Starting Wiredoor status watcher..."
exec /usr/bin/wiredoor status --watch --interval=10
