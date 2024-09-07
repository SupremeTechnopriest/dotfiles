#!/usr/bin/env sh

rofi_config="~/.config/rofi/launcher.rasi"

# Scale for monitor x res
monitor_trans=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .transform')
monitor_width=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
monitor_height=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height')
monitor_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')
monitor_res=$((monitor_trans == 0 ? monitor_width : monitor_height))
window_width=$(((monitor_res - 80) / (monitor_scale / 100)))
window_width=$((window_width < 1140 ? window_width : 1140))

# set rofi override
r_override="window{width: ${window_width}px;}"

# Launch rofi
rofi -config "${rofi_config}" -theme-str "${r_override}" "$@"
