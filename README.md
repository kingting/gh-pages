Welcome to our comprehensive guide on transforming your README.md file into a polished GitHub Pages site using Jekyll and GitHub Actions. This guide is designed to provide you with a streamlined approach to setting up, configuring, and automating the publishing process, ensuring a seamless transition from markdown to a fully functional website.

### Key Benefits

**Seamless Transition**: Automatically convert your README.md into a full-fledged website without manual intervention.

**Effortless Publishing**: Streamline your workflow, minimizing manual steps and reducing potential errors.

**Leverage Themes and Plugins**: Enhance your site's appearance and functionality with a variety of Jekyll themes and plugins.

**Enhanced Content Management**: Expand your content beyond your README.md to include blogs, documentation, and tutorials.

**SEO and Discoverability**: Optimize your site for search engines to increase visibility.

**Scalability and Flexibility**: Easily expand your site and integrate with other platforms.

**Integration with Other Platforms**: Effortlessly publish your content to other platforms or websites.

### What You'll Learn

In this guide, you will discover how to effectively use Jekyll to transform your README.md into a professional GitHub Pages site. You will find practical examples for creating dynamic content, such as interactive buttons and scripts, to make your site more engaging. Additionally, you will learn how to set up basic GitHub Actions to automate your publishing workflow, ensuring a seamless and efficient process.

By following this guide, you will not only enhance your technical skills but also improve your content management and SEO strategies. This will make your site more discoverable and user-friendly. Dive in to explore how you can leverage these powerful tools to create a dynamic and optimized web presence.


## Prerequisites

- GitHub account
- Basic knowledge of Git and Markdown
- Ruby and Bundler installed on your local machine (for local testing)

## Setup Steps

### 1. Create Repository

Create a new GitHub repository named `gh-pages` or clone this repo.

### 2. Create a script to prepare for Jekyll build

Create a script [.github/scripts/init-jekyll.sh](https://github.com/kingting/gh-pages/blob/main/.github/scripts/init-jekyll.sh) to convert README.md to index.md. This conversion is commonly done because Jekyll can process index.md to generate the main index.html page, which serves as the homepage of your site. During this process, you can embellish index.md with additional information, such as metadata, navigation links, and other content enhancements, to improve the blogging experience. Additionally, the script includes an example of using JavaScript to show and hide code blocks by reader. This approach allows you to leverage Markdown's simplicity while creating a comprehensive 'index.html' through Jekyll. 

<!-- Start Button -->
[.github/scripts/init-jekyll.sh](https://github.com/kingting/gh-pages/blob/main/.github/scripts/init-jekyll.sh)
<!-- End Button -->
<!-- Start Button -->
[.github/scripts/script.js](https://github.com/kingting/gh-pages/blob/main/.github/scripts/script.js)
<!-- End Button -->

### 3. Configure GitHub Actions Workflows to build Jekyll site and deploy to GitHub Pages

Create a GitHub Actions workflow at [.github/workflows/gh-pages.yml](https://github.com/kingting/gh-pages/blob/main/.github/workflows/gh-pages.yml) that includes build and deployment jobs for GitHub Pages.

<!-- Start Button -->
[.github/workflows/gh-pages.yml](https://github.com/kingting/gh-pages/blob/main/.github/workflows/gh-pages.yml)
<!-- End Button -->

### 4. Test Locally

To test the site locally with the `baseurl` set:

Build the site:
```sh
./.github/scripts/init-jekyll.sh
bundle exec jekyll build --baseurl="/gh-pages"
rm index.md
```

Serve the site:
```sh
bundle exec jekyll serve --baseurl="/gh-pages"
```

Open your browser and go to `http://localhost:4000/gh-pages/` to verify.

### 5. Commit Changes to README.md, and GitHub Pages Will Be Automatically Updated

Commit and push your changes to the `main` branch:
```sh
git add .
git commit -m "Set up Jekyll site with GitHub Actions"
git push origin main
```

Go to your repository settings on GitHub, navigate to "Pages" under "Code and automation," and ensure the Source under "GitHub Pages" - "Build and Deployment" is set to "GitHub Actions."

Your site should now be live at `https://username.github.io/gh-pages`.

## Additional Customizations

Feel free to customize your Jekyll site by editing the [_config.yml](https://github.com/kingting/gh-pages/blob/main/_config.yml), adding new pages, and modifying the styles in [assets/css/style.scss](https://github.com/kingting/gh-pages/blob/main/assets/css/style.scss).

<span class="page-button-container">
  <button data-script-name="style.scss" onclick="fetchAndDisplayScript('script-content-style', 'https://raw.githubusercontent.com/kingting/gh-pages/main/assets/css/style.scss', this)" class="page-button">Show style.scss</button>
</span>
<div id="script-content-style" style="display:none; white-space: pre-wrap;"></div>

## References

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

By following these steps, any changes made to `README.md` in your repository will automatically be reflected on your GitHub Pages site. This GitHub Actions workflow can also be enhanced to publish `README.md` as content or a blog on other websites, if desired. This approach saves time by automating the publication process across multiple platforms and simplifies the management of your blog content.
### Expanded Benefits

Automating the publishing of your `README.md` to GitHub Pages offers numerous benefits, making the process seamless, efficient, and feature-rich. Here are some of the key advantages:

1. **Seamless Transition from README.md to GitHub Pages**:
   - Automatically convert your `README.md` into a full-fledged website without manual intervention.
   - Ensures that any updates to your `README.md` are instantly reflected on your GitHub Pages site, maintaining consistency.

2. **Effortless Publishing Process**:
   - Streamlines the workflow, reducing the need for manual steps and potential errors.
   - Once set up, the process runs automatically with every push to the repository, saving time and effort.

3. **Leverage Jekyll Themes and Plugins**:
   - Take advantage of Jekyll's extensive theme library to enhance the appearance of your site.
   - Utilize Jekyll plugins to add features like SEO optimization, sitemaps, and RSS feeds, enriching your site's functionality and reach.

4. **Enhanced Content Management**:
   - Easily include additional content beyond your `README.md`, such as blogs, documentation, and tutorials.
   - Structure your content with Jekyll's powerful templating system, making it easy to maintain and expand.

5. **SEO and Discoverability**:
   - Jekyll and its plugins enable you to optimize your site for search engines, increasing visibility.
   - Properly structured content and metadata help search engines index your site more effectively, driving more traffic.

6. **Scalability and Flexibility**:
   - The approach scales well with your project, allowing you to add new pages, sections, and features as needed.
   - Easily integrate with other static site generators or content management systems if your needs grow.

7. **Integration with Other Platforms**:
   - Once your content is on GitHub Pages, it can be effortlessly published to other platforms or websites.
   - Automated workflows can be extended to deploy content to multiple sites simultaneously, ensuring a consistent presence across the web.

### Conclusion

By following this guide, you can automate the publishing of your `README.md` to GitHub Pages, taking advantage of Jekyll's powerful features and GitHub Actions' automation capabilities. This approach saves time, ensures consistency, and opens up a range of possibilities for enhancing and expanding your content. The provided scripts and detailed steps make it easy to set up and get started quickly, providing a practical and efficient solution for managing your documentation and content.

### Scripts and Configuration Files

The blog includes practical scripts and configuration files that you can use to set up your own automated publishing process. These include:

- **Jekyll Configuration (`_config.yml`)**: Setting up your Jekyll site with themes and plugins.
- **GitHub Actions Workflow (`.github/workflows/gh-pages.yml`)**: Automating the build and deployment process.
- **Custom Scripts ('.github/scripts/*')**: Enhancing functionality and content management.

By following this comprehensive guide, you will be equipped with the knowledge and tools to seamlessly publish your `README.md` as a dynamic and optimized GitHub Pages site.

