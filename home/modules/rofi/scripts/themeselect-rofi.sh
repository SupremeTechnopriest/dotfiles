#!/usr/bin/env sh

source ~/.config/themes/scripts/global-control.sh

rofi_config="~/.config/rofi/themeselect.rasi"

# Scale for monitor x res
x_monres=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
monitor_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')
x_monres=$(( x_monres * 17 / monitor_scale ))


# set rofi override
elem_border=$(( hypr_border * 3 ))
r_override="element{border-radius:${elem_border}px;} element{padding:0px;orientation:vertical;} element-icon{size:${x_monres}px;border-radius:0px;} element-text{padding:1em;}"


# Launch rofi
ThemeSel=$(cat "$ThemeCtl" | while read line
do
  theme=`echo $line | cut -d '|' -f 2`
  wallpaper=`echo $line | awk -F '/' '{print $NF}'`
  echo -en "$theme\0icon\x1f${CacheDir}/${theme}/${wallpaper}\n"
done | rofi -dmenu -theme-str "${r_override}" -config "${rofi_config}" -select "${gtk_theme}")

if [ ! -z $ThemeSel ] ; then
  "${ThemeDir}/scripts/switch-theme.sh" -s $ThemeSel
fi
