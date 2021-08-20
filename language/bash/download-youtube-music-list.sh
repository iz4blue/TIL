#!/bin/bash
source venv/bin/activate

LIST_FILE="music.list"
LIST=$(cat $LIST_FILE)

for url in $LIST
do
    echo "$url"
    youtube-dl -f 'bestaudio[ext=m4a]' --output "%(id)s.%(ext)s" ${url}
done
