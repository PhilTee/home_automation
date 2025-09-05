#!/bin/bash
file=$1

title=$(ebook-meta "$file" | grep -m1 -i "Title" | cut -d ':' -f 2- | sed 's/^[ \t]*//;s/[ \t]*$//;s/:/ -/g')
author=$(ebook-meta "$file" | grep -m1 -i "Author" | cut -d ':' -f 2- | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/\[.*\]//;s/^[ \t]*//;s/[ \t]*$//')

extension="${file##*.}"
library_path="/opt/plexmedia/books/`date +%b%Y`"

mkdir -p "$library_path"

if [ "$extension" == "epub" ]; then
  ebook-convert "$file" "$library_path/$title - $author.mobi"
elif [ "$extension" == "mobi" ]; then
  mv "$file" "$library_path/$title - $author.mobi"
else
  echo "Unsupported file: $file"
fi

