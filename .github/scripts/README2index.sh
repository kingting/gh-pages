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
