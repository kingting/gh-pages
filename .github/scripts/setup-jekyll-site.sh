#!/bin/bash
# File: setup-jekyll-site.sh
#----------------------------------------------------------------------------------

# Create Gemfile
cat <<EOF > Gemfile
source 'https://rubygems.org'

gem "jekyll"
gem "github-pages"
gem "jekyll-theme-cayman"

group :jekyll_plugins do
  gem "jekyll-sitemap"
  gem "jekyll-feed"
  gem "jekyll-seo-tag"
end
EOF

#----------------------------------------------------------------------------------
# Create _config.yml
#----------------------------------------------------------------------------------
cat <<EOF > _config.yml
title: Technical Insight
description: A precise guide providing practical, tried and tested examples.
baseurl: "/gh-pages" # the subpath of your site, e.g. /blog
show_downloads: true
url: "https://kingting.github.io" # the base hostname & protocol for your site
github:
  is_project_page: true
  repository_url: https://github.com/kingting/gh-pages
  repository_name: gh-pages 
  owner_url: https://github.com/kingting
  owner_name: kingting

# Build settings
markdown: kramdown
theme: jekyll-theme-cayman

plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-seo-tag
EOF

#----------------------------------------------------------------------------------
# Create default layout
#----------------------------------------------------------------------------------
mkdir -p _layouts
cat <<EOF > _layouts/default.html

<!DOCTYPE html>
<html lang="{{ site.lang | default: "en-US" }}">
  <head>
    <meta charset="UTF-8">

{% seo %}
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="preload" href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap" as="style" type="text/css" crossorigin>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#157878">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <link rel="stylesheet" href="{{ '/assets/css/style.css?v=' | append: site.github.build_revision | relative_url }}">
    {% include head-custom.html %}
  </head>
  <body>
    <a id="skip-to-content" href="#content">Skip to the content.</a>

    <header class="page-header" role="banner">
      <h1 class="project-name">{{ page.title | default: site.title | default: site.github.repository_name }}</h1>
      <h2 class="project-tagline">{{ page.description | default: site.description | default: site.github.project_tagline }}</h2>
      {% if site.github.is_project_page %}
        <a href="{{ site.github.repository_url }}" class="btn">View on GitHub</a>
      {% endif %}
      {% if site.show_downloads %}
        <a href="{{ site.github.zip_url }}" class="btn">Download .zip</a>
        <a href="{{ site.github.tar_url }}" class="btn">Download .tar.gz</a>
      {% endif %}
    </header>

    <main id="content" class="main-content" role="main">
      {{ content }}

      <footer class="site-footer">
        {% if site.github.is_project_page %}
          <span class="site-footer-owner"><a href="{{ site.github.repository_url }}">{{ site.github.repository_name }}</a> is maintained by <a href="{{ site.github.owner_url }}">{{ site.github.owner_name }}</a>.</span>
        {% endif %}
        <span class="site-footer-credits">This page was generated by <a href="https://pages.github.com">GitHub Pages</a>.</span>
      </footer>
    </main>
  </body>
</html>

EOF

#----------------------------------------------------------------------------------
# Copy README.md to index.md with front matter
#----------------------------------------------------------------------------------
cat <<EOF > index.md
---
layout: default
title: Docker Quick Start Guide
---
EOF
cat README.md >> index.md
