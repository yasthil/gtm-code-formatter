#!/bin/bash
# GTM Code Formatter
# Parameters: 
# 1. File Name - name of file that contains  GTM code
# 2. 'js' (Format code for JS) or 'gtm' (Format code for GTM)

# replace all instances of {{}} with something text editor friendly

# Remove whitespace from all {{}} occurances
while read lineOfText; do
    gtmVar="$(echo -e "${lineOfText}" | grep -Pio '({{)(.*)(}})')"
    replaceWhitespaceWith="__"
    jsGtmVarNameWithBrackets=${gtmVar//" "/$replaceWhitespaceWith}
    echo -e "${jsGtmVar}"
    
done <$1

# Note the double quotes
#local search=''
#local replace=''
#sed -i "" "s/{{\(.*\)}}/${replace}/g" $1


#grep -Pio '({{)(.*)(}})' gtmCodeFormatter.sh
