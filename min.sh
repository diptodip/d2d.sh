#!/bin/bash

# minify css

echo -e "\033[0;32m[INFO] Minifying CSS...\033[0m"

FLOW=layouts/partials/flow.html
MINFLOW=layouts/partials/flow.min.html

NIGHT=layouts/partials/night.html
MINNIGHT=layouts/partials/night.min.html


cat $FLOW | sed -e 's/  //g; s/  //g; s/\([:{;,]\) /\1/g; s/ {/{/g; s/\/\*.*\*\///g; /^$/d;' | sed -e :a -e '$!N; s/\n\(.\)/\1/; ta' > $MINFLOW;
cat $NIGHT | sed -e 's/  //g; s/  //g; s/\([:{;,]\) /\1/g; s/ {/{/g; s/\/\*.*\*\///g; /^$/d;' | sed -e :a -e '$!N; s/\n\(.\)/\1/; ta' > $MINNIGHT;

# success
echo -e "\033[0;32m[INFO] OK!\033[0m"
