for x in *.xbm
    do convert -fill "#a6e22e" -opaque "#000" -transparent "#fff" "${x}" "${x%.*}.png"
done
