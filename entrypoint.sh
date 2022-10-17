#!/usr/bin/env bash
bash $ESP_IDF_ROOT/install.sh
source $ESP_IDF_ROOT/export.sh
exec "$@"
