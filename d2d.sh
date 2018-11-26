#!/bin/bash

# minify css

echo -e "\033[0;32m[INFO] Minifying CSS...\033[0m"

FLOW=layouts/partials/flow.html
MINFLOW=layouts/partials/flow.min.html

NIGHT=layouts/partials/night.html
MINNIGHT=layouts/partials/night.min.html


cat $FLOW | sed -e 's/  //g; s/  //g; s/\([:{;,]\) /\1/g; s/ {/{/g; s/\/\*.*\*\///g; /^$/d;' | sed -e :a -e '$!N; s/\n\(.\)/\1/; ta' > $MINFLOW
cat $NIGHT | sed -e 's/  //g; s/  //g; s/\([:{;,]\) /\1/g; s/ {/{/g; s/\/\*.*\*\///g; /^$/d;' | sed -e :a -e '$!N; s/\n\(.\)/\1/; ta' > $MINNIGHT

echo -e "\033[0;32m[INFO] Deploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="Rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..

# success
echo -e "\033[0;32m[INFO] OK!\033[0m"
