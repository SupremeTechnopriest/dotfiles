#!/usr/bin/env sh

# Set variables
ScrDir=`dirname $(realpath $0)`
source ${ScrDir}/global-control.sh

ctl_line=`grep '^1|' $ThemeCtl`
current_theme=`echo $ctl_line | cut -d '|' -f 2`
full_path=`echo $ctl_line | cut -d '|' -f 3`
full_path=`eval echo $full_path`
wall_name=`echo $full_path | awk -F '/' '{print $NF}'`
wall_path=`echo $full_path | sed "s/\/$wall_name//g"`

if [ ! -f  $wall_path/$wall_name ] ; then
  if [ -d $ThemeDir/wallpapers/$current_theme ] ; then
    wall_path="$ThemeDir/wallpapers/$current_theme"
    full_path=`ls $wall_path/* | head -1`
  else
    echo "ERROR: wallpaper $wall_path/$wall_name not found..."
    exit 1
  fi
fi

wall_list=`ls $wall_path/*`

wall_set="$ThemeDir/wall.set"
wall_blr="$ThemeDir/wall.blur"
wall_rfi="$ThemeDir/wall.rofi"

if [  `echo $ctl_line | wc -w` -ne "1" ] ; then
  echo "ERROR : $ThemeCtl Unable to fetch theme..."
  exit 1
fi

# Define functions

Wall_Update()
{
  local x_wall=$1
  local x_update=${x_wall/$HOME/"~"}
  cache_img=`echo $x_wall | awk -F '/' '{print $NF}'`

  if [ ! -d ${CacheDir}/${current_theme} ] ; then
    mkdir -p ${CacheDir}/${current_theme}
  fi

  if [ ! -f "${CacheDir}/${current_theme}/${cache_img}" ] ; then
    convert -strip $x_wall -thumbnail 500x500^ -gravity center -extent 500x500 ${CacheDir}/${current_theme}/${cache_img}
  fi

  if [ ! -f "${CacheDir}/${current_theme}/${cache_img}.rofi" ] ; then
    convert -strip -resize 2000 -gravity center -extent 2000 -quality 90 $x_wall ${CacheDir}/${current_theme}/${cache_img}.rofi
  fi

  if [ ! -f "${CacheDir}/${current_theme}/${cache_img}.blur" ] ; then
    convert -strip -scale 10% -blur 0x3 -resize 100% $x_wall ${CacheDir}/${current_theme}/${cache_img}.blur
  fi

  sed -i "/^1|/c\1|${current_theme}|${x_update}" $ThemeCtl
  ln -fs $x_wall $wall_set
  ln -fs ${CacheDir}/${current_theme}/${cache_img}.rofi $wall_rfi
  ln -fs ${CacheDir}/${current_theme}/${cache_img}.blur $wall_blr
}

Wall_Change()
{
  local x_switch=$1

  for (( i=0 ; i<${#wall_list[@]} ; i++ ))
  do
    if [ ${wall_list[i]} == ${full_path} ] ; then

      if [ $x_switch == 'n' ] ; then
        next_index=$(( (i + 1) % ${#wall_list[@]} ))
      elif [ $x_switch == 'p' ] ; then
        next_index=$(( i - 1 ))
      fi
      Wall_Update ${wall_list[next_index]}
      break
    fi
  done
}

Wall_Set()
{
  if [ -z $xtrans ] ; then
    xtrans="grow"
  fi

  swww img $wall_set \
    --transition-bezier .43,1.19,1,.4 \
    --transition-type $xtrans \
    --transition-duration 0.7 \
    --transition-fps 60 \
    --invert-y \
    --transition-pos "$( hyprctl cursorpos )"
}

# Evaluate options
while getopts "nps" option ; do
  case $option in
    n ) # Set next wallpaper
      xtrans="grow"
      Wall_Change n ;;
    p ) # Set previous wallpaper
      xtrans="outer"
      Wall_Change p ;;
    s ) # Set input wallpaper
      shift $((OPTIND -1))
      if [ -f $1 ] ; then
        echo $1
        Wall_Update $1
      fi ;;
    * ) # Invalid option
      echo "n : set next wallpaper"
      echo "p : set previous wallpaper"
      echo "s : set wallpaper from parameter"
      exit 1 ;;
  esac
done


# Check swww daemon and set wall
swww query
if [ $? -eq 1 ] ; then
  swww init
fi


if [ "$#" -eq 0 ]; then
  Wall_Update $full_path
fi

Wall_Set
