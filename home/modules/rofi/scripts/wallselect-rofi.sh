#!/usr/bin/env sh

source ~/.config/themes/scripts/global-control.sh

rofi_config="~/.config/rofi/themeselect.rasi"

ctl_line=`grep '^1|' "$ThemeCtl"`
if [ `echo $ctl_line | wc -l` -ne "1" ] ; then
    echo "ERROR : $ThemeCtl Unable to fetch theme..."
    exit 1
fi

full_path=$(echo "$ctl_line" | awk -F '|' '{print $NF}' | sed "s+~+$HOME+")
wall_path=$(dirname "$full_path")
if [ ! -d "${wall_path}" ] && [ -d "${ThemeDir}/wallpapers/${current_theme}" ] && [ ! -z "${current_theme}" ] ; then
    wall_path="${ThemeDir}/${current_theme}"
fi


# Scale for monitor x res
x_monres=$(hyprctl -j monitors | jq '.[] | select(.focused==true) | .width')
monitor_scale=$(hyprctl -j monitors | jq '.[] | select (.focused == true) | .scale' | sed 's/\.//')
x_monres=$(( x_monres * 17 / monitor_scale ))


# set rofi override
elem_border=$(( hypr_border * 3 ))
r_override="element{border-radius:${elem_border}px;} element{padding:0px;orientation:vertical;} element-icon{size:${x_monres}px;border-radius:0px;} element-text{padding:1em;}"


# Launch rofi
current_wall=`basename $full_path`


WallSel=$( find "${wall_path}/" -type f \( -iname "*.gif" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | sort | while read rfile
do
    echo -en "$rfile\0icon\x1f${rfile}\n"
done | rofi -dmenu -theme-str "${r_override}" -config "${rofi_config}" -select "${current_wall}")

if [ ! -z $WallSel ] ; then
  "~/.config/themes/scripts/switch-wallpaper.sh" -s $WallSel
fi
