#!/bin/bash
#----------------------------------------------------------------------------------
# Copy README.md to index.md with front matter
#----------------------------------------------------------------------------------
cat <<EOF > index.md
---
layout: default
title: Automated GitHub Pages using Jekyll and GitHub Actions
---
EOF
cat README.md >> index.md

#----------------------------------------------------------------------------------
# Include javascript 
#----------------------------------------------------------------------------------
echo "{% raw %}"  >> index.md
echo "<script>" >> index.md
cat .github/scripts/script.js >> index.md
echo "</script>" >> index.md
echo "{% endraw %}"  >> index.md

#----------------------------------------------------------------------------------
# Additional code or info to enhance the blog
#----------------------------------------------------------------------------------
