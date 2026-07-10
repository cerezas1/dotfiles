#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -n1)

[ -z "$player" ] && exit 0

status=$(playerctl status 2>/dev/null)

[ "$status" != "Playing" ] && exit 0

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [ -n "$artist" ]; then
    text="$artist - $title"
else
    text="$title"
fi

text=$(echo "$text" | sed 's/&/\&amp;/g')

max=45

if [ ${#text} -gt $max ]; then
    text="${text:0:$((max-3))}..."
fi

echo "$text"
