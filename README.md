# Converting README.md into a GitHub Pages Site

## Background

This guide provides a quick and precise method to publish a `README.md` file into a GitHub Pages site using Jekyll and GitHub Actions. It includes setting up necessary files to configure Jekyll, and automating the publishing process using GitHub Actions.

## Prerequisites

- GitHub account
- Basic knowledge of Git and Markdown
- Ruby and Bundler installed on your local machine (for local testing)

## Setup Steps

### 1. Create Repository

Create a new GitHub repository named `my-jekyll-site`.

### 2. Create a GitHub Action to convert README.md to index.md

<button onclick="fetchAndDisplayScript('script-content-dockerfile', 'https://raw.githubusercontent.com/kingting/gh-pages/main/.github/actions/update-readme/Dockerfile')">Dockerfile</button>
<div id="script-content-dockerfile" style="display:none; white-space: pre-wrap;"></div>

<button onclick="fetchAndDisplayScript('script-content-action', 'https://raw.githubusercontent.com/kingting/gh-pages/main/.github/actions/update-readme/action.yaml')">action.yaml</button>
<div id="script-content-action" style="display:none; white-space: pre-wrap;"></div>

<button onclick="fetchAndDisplayScript('script-content-update-readme', 'https://raw.githubusercontent.com/kingting/gh-pages/main/.github/actions/update-readme/update-readme.sh')">update-readme.sh</button>
<div id="script-content-update-readme" style="display:none; white-space: pre-wrap;"></div>

### 3. Create Jekyll Setup Script

Gemfile
layouts/defaults.html
_config.yml
assets/css/style.css

### 4. Configure GitHub Actions Workflows

Create a GitHub Actions workflow file named `gh-pages.yml` in `.github/workflows/` with the following content:

[gh-pages.yml](https://github.com/kingting/gh-pages/blob/main/.github/workflows/gh-pages.yml)

### 5. Test Locally

To test the site locally with the `baseurl` set:

1. Build the site:

```sh
bundle exec jekyll build --baseurl="/my-jekyll-site"
```

2. Serve the site:

```sh
bundle exec jekyll serve --baseurl="/my-jekyll-site"
```

Open your browser and go to `http://localhost:4000/my-jekyll-site/` to verify.

### 6. Commit changes to README.md, and GitHub Pages will be automatically updated.
1. Commit and push your changes to the `main` branch:

```sh
git add .
git commit -m "Set up Jekyll site with GitHub Actions"
git push origin main
```

2. Go to your repository settings on GitHub, navigate to "Pages" under "Code and automation," and ensure the Source under "GitHub Pages" - "Build and Deployment" is set to "GitHub Actions.

Your site should now be live at `https://username.github.io/my-jekyll-site`.

## Additional Customizations

Feel free to customize your Jekyll site by editing the `_config.yml`, adding new pages, and modifying the styles in `assets/css/style.scss`. 

To add custom styles, create `assets/css/style.scss` with the following content:

```scss
---
---

@import "{{ site.theme }}";

// Your custom styles go here
body {
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
}
```

## References

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

By following these steps, any changes made to README.md in your repository will automatically be reflected on your GitHub Pages site. This GitHub Actions workflow can also be enhanced to publish README.md as content or a blog on other websites, if desired. This approach saves time by automating the publication process across multiple platforms and simplifies the management of your blog content.

{% raw %}

<script>
function fetchAndDisplayScript(containerId, scriptUrl) {
  var container = document.getElementById(containerId);

  if (container.style.display === "none" || container.style.display === "") {
    fetch(scriptUrl)
      .then(response => response.text())
      .then(data => {
        container.innerHTML = '<pre><code>' + data + '</code></pre>';
        container.style.display = "block";
      })
      .catch(error => {
        console.error('Error fetching the script:', error);
        container.innerHTML = '<pre><code>Error fetching the script.</code></pre>';
        container.style.display = "block";
      });
  } else {
    container.style.display = "none";
  }
}
</script>

{% endraw %}


