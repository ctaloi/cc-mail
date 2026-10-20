#!/bin/bash
# Link cc-mail into place and bind SUPER+ALT+M. Safe to re-run.
set -euo pipefail

repo=$(cd "$(dirname "$0")" && pwd)
bindings=~/.config/hypr/bindings.lua

mkdir -p ~/.local/bin ~/.local/share/applications ~/.local/share/icons/hicolor/256x256/apps
ln -sfn "$repo/bin/cc-mail" ~/.local/bin/cc-mail
ln -sfn "$repo/share/cc-mail.desktop" ~/.local/share/applications/cc-mail.desktop
ln -sfn "$repo/share/cc-mail.png" ~/.local/share/icons/hicolor/256x256/apps/cc-mail.png
ln -sfn "$repo/hypr/cc_mail.lua" ~/.config/hypr/cc_mail.lua
gtk-update-icon-cache ~/.local/share/icons/hicolor >/dev/null 2>&1 || true

if ! grep -q 'require("hypr.cc_mail")' "$bindings"; then
  printf '\n-- Hand an Omamail message to Claude Code (~/src/cc-mail).\nrequire("hypr.cc_mail")\n' >>"$bindings"
fi

hyprctl reload >/dev/null
errors=$(hyprctl configerrors)
if [[ -n ${errors//[[:space:]]/} ]]; then
  echo "$errors" >&2
  exit 1
fi
echo "cc-mail installed: SUPER+ALT+M"
