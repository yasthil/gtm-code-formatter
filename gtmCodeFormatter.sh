#!/bin/bash
# GTM Code Formatter
# Parameters: 
# 1. File Name - name of file that contains  GTM code
# 2. 'js' (Format code for JS) or 'gtm' (Format code for GTM)

# replace all instances of {{}} with something text editor friendly

# Remove whitespace from all {{}} occurances
while read lineOfText; do
    # find the GTM variables
    gtmVar="$(echo -e "${lineOfText}" | grep -Pio '({{)(.*)(}})')"

    # replace whitespaces with __
    replaceWhitespaceWith="__"
    replaceDashwithDASH="DASH"
    jsGtmVarNameWithBrackets=${gtmVar//" "/$replaceWhitespaceWith}

    if [ -n "${jsGtmVarNameWithBrackets}" ]; then
        # replace - with DASH
        jsGtmVarWithDASH=${jsGtmVarNameWithBrackets//"-"/$replaceDashwithDASH}
        #jsGtmVar="$(echo -e "${lineOfText}" | sed "s/${gtmVar}/zzz${jsGtmVarNameWithBrackets}zzz/" | sed -i.bak "s/\({{\)\(.*\)\(}}\)/\2/")"
        sed -i "s/${gtmVar}/zzz${jsGtmVarWithDASH}zzz/" $1        
        #jsGtmVar="$(echo -e "${lineOfText}" | sed "s/${gtmVar}/zzz${jsGtmVarNameWithBrackets}zzz/")"
        #echo -e "${jsGtmVar}"
    fi    
    
done <$1

# Remove {{}} keep only the inner text
sed -i "s/\({{\)\(.*\)\(}}\)/\2/" $1

# Note the double quotes
#local search=''
#local replace=''
#sed -i "" "s/{{\(.*\)}}/${replace}/g" $1


#grep -Pio '({{)(.*)(}})' gtmCodeFormatter.sh

## USE THIS!!!
# efficient way - GTM code to valid JS code
# sed -i "s/\({{\)\(.*\)\(}}\)/'\(\2\)'/" ProviderSearchFromAjaxResponse2.js

# efficient way - JS code back to GTM code
#sed -i "s/\('{{\)\(.*\)\(}}'\)/\{{\2\}}/" ProviderSearchFromAjaxResponse2.js

