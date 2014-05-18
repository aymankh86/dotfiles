mov_file=$1
gif_file=$2

ffmpeg -i $mov_file -r 10 -f image2pipe -vcodec ppm - | convert -verbose +dither -layers Optimize -resize 640x640\> - gif:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile -> $gif_file
