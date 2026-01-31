#!/bin/sh
echo -ne '\033c\033]0;player\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/kintsugi_protocol.x86_64" "$@"
