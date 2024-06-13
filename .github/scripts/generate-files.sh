#!/bin/bash

# Create Gemfile
cat <<EOF > Gemfile
source 'https://rubygems.org'

gem "jekyll"
gem "github-pages"

group :jekyll_plugins do
  gem "jekyll-sitemap"
  gem "jekyll-feed"
  gem "jekyll-seo-tag"
end
EOF

# Create _config.yml
cat <<EOF > _config.yml
title: Docker Quick Start Guide
description: A brief description of your site
baseurl: "" # the subpath of your site, e.g. /blog
url: "https://yourusername.github.io" # the base hostname & protocol for your site

# Build settings
markdown: kramdown
theme: minima

plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-seo-tag
EOF

# Create default layout
mkdir -p _layouts
cat <<EOF > _layouts/default.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>{{ page.title }}</title>
  <link rel="stylesheet" href="{{ '/assets/css/style.css' | relative_url }}">
</head>
<body>
  <header>
    <h1>{{ site.title }}</h1>
    <p>{{ site.description }}</p>
  </header>
  <main>
    {{ content }}
  </main>
</body>
</html>
EOF

