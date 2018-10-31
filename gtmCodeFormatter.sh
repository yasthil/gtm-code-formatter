#!/bin/bash
# GTM Code Formatter
# Parameters: 
# 1. File Name - name of file that contains  GTM code
# 2. 'js' (Format code for JS) or 'gtm' (Format code for GTM)

# Example: Run the following in a Bash terminal - like Git Bash, from the same directory
# GTM code -> JS code
#   ./gtmCodeFormatter.sh ProviderSearchFromAjaxResponse2.js 'js'
# JS code -> GTM code
#   ./gtmCodeFormatter.sh ProviderSearchFromAjaxResponse2.js 'gtm'


if [[ $# -eq 0 ]] ; then
    echo "No params given. Please specify the file to edit as parameter 1."
    echo "Format: ./gtmCodeFormatter.sh FILE_NAME OPTION"
    echo "OPTION can either be 'js' or 'gtm'"    
    exit 0;
fi

# GTM code -> JS code
if [ $2 == 'js' ]; then
    # replace all instances of {{}} with '{{}}'    
    sed -i "s/\({{\)\(.*\)\(}}\)/'\{{\2\}}'/" $1
    # 2. getting rid of script tags
    sed -i "s/\(<script>\)/\/\/\1/" $1
    sed -i "s/\(<\/script>\)/\/\/\1/" $1
elif [ $2 == 'gtm' ]; then
    # JS code -> GTM code
    # Reverse 1.
    sed -i "s/\('{{\)\(.*\)\(}}'\)/\{{\2\}}/" $1
    # Reverse 2.1
    sed -i "s/\(\/\/<script>\)/<script>/" $1
    # Reverse 2.2
    sed -i "s/\(\/\/<\/script>\)/<\/script>/" $1
else   
    echo "Unknown param"
fi

