#icon_color with
(echo "{"; for i in icons/*png; do echo "\"$(sed "s|icons/||g" <<< $i)\": $(convert $i -scale 1x1\! -format '%[pixel:u]' info:-| sed 's|^srgba(|[|g'| cut -d"," -f-3| sed 's|$|],|g')"; done; echo "}") > icon_colors.json
