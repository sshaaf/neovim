# Hugo Setup for Neovim4j Documentation

This guide explains how to work with the Hugo-based documentation site.

## Quick Setup

### Install Hugo

**macOS:**
```bash
brew install hugo
```

**Linux:**
```bash
# Debian/Ubuntu
sudo apt-get install hugo

# Arch
sudo pacman -S hugo

# Or download from: https://github.com/gohugoio/hugo/releases
```

**Windows:**
```bash
choco install hugo-extended
# or
scoop install hugo-extended
```

### Install Theme

The documentation uses the [Hugo Book](https://github.com/alex-shpak/hugo-book) theme.

```bash
cd docs/

# Install theme as git submodule
git submodule add https://github.com/alex-shpak/hugo-book themes/hugo-book

# Or clone directly
git clone https://github.com/alex-shpak/hugo-book themes/hugo-book
```

### Directory Structure

```
docs/
├── hugo.toml              # Hugo configuration
├── .gitignore             # Ignore build output
├── content/               # All markdown content
│   ├── _index.md          # Home page
│   ├── getting-started.md
│   ├── install.md
│   ├── quick-reference.md
│   └── tutorial/
│       ├── _index.md
│       ├── 01-project-setup.md
│       ├── 02-hello-world.md
│       └── ...
├── static/                # Static files (images, etc.)
│   └── screenshot.jpg
├── themes/                # Hugo themes
│   └── hugo-book/
└── public/                # Generated site (gitignored)
```

## Local Development

### Run Hugo Server

```bash
cd docs/

# Start development server
hugo server

# With drafts and future posts
hugo server -D -F

# Visit: http://localhost:1313
```

**Features:**
- Live reload on file changes
- Fast rebuilds
- Draft content preview

### Build for Production

```bash
cd docs/

# Build site
hugo

# Output is in: docs/public/
```

### Clean Build

```bash
cd docs/

# Remove generated files
rm -rf public/ resources/

# Rebuild
hugo
```

## Content Organization

### Front Matter Format

All content files need Hugo front matter:

```yaml
---
title: "Page Title"
weight: 10
bookToc: true
bookCollapseSection: false
---
```

**Common Parameters:**
- `title` - Page title (required)
- `weight` - Menu order (lower = higher)
- `bookToc` - Show table of contents
- `bookCollapseSection` - Collapse section in menu
- `bookFlatSection` - Flatten section hierarchy
- `bookHidden` - Hide from menu

### Creating New Pages

```bash
# Create new page
hugo new content/my-page.md

# Create new tutorial lesson
hugo new content/tutorial/11-new-lesson.md
```

### Menu Structure

Hugo Book theme uses `weight` for ordering:

```yaml
# Lower weight = appears first
---
title: "First Page"
weight: 1
---

---
title: "Second Page"
weight: 2
---
```

### Sections

Create `_index.md` in a directory to make it a section:

```bash
content/
  tutorial/
    _index.md          # Section page
    01-lesson.md       # Child page
    02-lesson.md       # Child page
```

## Hugo Book Theme Features

### Shortcodes

**Hints/Callouts:**
```markdown
{{</* hint info */>}}
This is an info hint.
{{</* /hint */>}}

{{</* hint warning */>}}
This is a warning.
{{</* /hint */>}}

{{</* hint danger */>}}
This is dangerous!
{{</* /hint */>}}
```

**Buttons:**
```markdown
{{</* button relref="/" */>}}Get Home{{</* /button */>}}
{{</* button href="https://github.com" */>}}GitHub{{</* /button */>}}
```

**Columns:**
```markdown
{{</* columns */>}}
Left column content
<--->
Right column content
{{</* /columns */>}}
```

**Expand/Collapse:**
```markdown
{{</* expand "Click to expand" */>}}
Hidden content here
{{</* /expand */>}}
```

**Tabs:**
```markdown
{{</* tabs "unique-id" */>}}
{{</* tab "MacOS" */>}} MacOS instructions {{</* /tab */>}}
{{</* tab "Linux" */>}} Linux instructions {{</* /tab */>}}
{{</* tab "Windows" */>}} Windows instructions {{</* /tab */>}}
{{</* /tabs */>}}
```

### Code Highlighting

```markdown
```java
public class Example {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
\```
```

Supports:
- Java
- Bash
- Vim
- JSON
- YAML
- And many more...

## GitHub Actions Deployment

### Workflow File

Located at: `.github/workflows/hugo.yml`

**Triggers:**
- Push to `main` branch
- Changes in `docs/**` directory
- Manual workflow dispatch

**What it does:**
1. Checks out repository
2. Installs Hugo
3. Builds site from `docs/`
4. Deploys to GitHub Pages

### Enable GitHub Pages

1. Go to repository **Settings**
2. Navigate to **Pages**
3. Under **Source**, select:
   - Source: **GitHub Actions**
4. Save

**Important:** With GitHub Actions, you DON'T select a branch/folder. The action handles deployment.

### First Deployment

```bash
# 1. Commit Hugo setup
git add .github/workflows/hugo.yml docs/
git commit -m "Add Hugo documentation with GitHub Actions"
git push

# 2. GitHub Actions will automatically:
#    - Build the site
#    - Deploy to GitHub Pages

# 3. Visit your site:
#    https://yourusername.github.io/neovim4j/
```

### Monitor Deployment

- Go to **Actions** tab in GitHub
- Watch the workflow run
- Check for any errors
- Once complete, site is live!

### Deployment Frequency

Site rebuilds on every push to `main` that modifies `docs/**`.

**Manual deployment:**
- Go to **Actions** tab
- Select "Deploy Hugo site to GitHub Pages"
- Click "Run workflow"

## Customization

### Site Configuration

Edit `docs/hugo.toml`:

```toml
baseURL = "https://yourusername.github.io/neovim4j/"
title = "Your Site Title"

[params]
  BookTheme = "dark"  # or "light", "auto"
  BookSearch = true
  BookToC = 3         # TOC depth
```

### Styling

Create `docs/static/custom.css`:

```css
:root {
  --body-background: #1a1a1a;
  --body-font-color: #e0e0e0;
}
```

Reference in config:

```toml
[params]
  BookCustomCSS = ["custom.css"]
```

### Logo

Add logo to `docs/static/logo.png`:

```toml
[params]
  BookLogo = "/logo.png"
```

## Troubleshooting

### Build Fails

**Check Hugo version:**
```bash
hugo version
# Should be 0.100.0+
```

**Clear cache:**
```bash
rm -rf public/ resources/ .hugo_build.lock
hugo
```

### Theme Not Found

```bash
# Ensure theme exists
ls docs/themes/hugo-book

# If missing, install:
cd docs/
git submodule add https://github.com/alex-shpak/hugo-book themes/hugo-book
```

### GitHub Actions Fails

**Check workflow syntax:**
- Verify YAML indentation
- Check Hugo version compatibility
- Review Actions logs for errors

**Common issues:**
- Wrong `working-directory` path
- Missing theme submodule
- Invalid `hugo.toml` syntax

### Links Not Working

**Use Hugo relref:**
```markdown
[Link]({{</* relref "/page" */>}})
```

**Not:**
```markdown
[Link](page.md)  # Won't work in Hugo
```

### Search Not Working

Ensure in `hugo.toml`:
```toml
[params]
  BookSearch = true

[outputs]
  home = ["HTML", "RSS", "JSON"]
```

## Migration from Jekyll

### Front Matter Changes

**Jekyll:**
```yaml
---
layout: default
title: Page
nav_order: 1
---
```

**Hugo:**
```yaml
---
title: Page
weight: 1
bookToc: true
---
```

### Link Syntax

**Jekyll:**
```markdown
[Link](page.md)
```

**Hugo:**
```markdown
[Link]({{</* relref "/page" */>}})
```

### Include Files

**Jekyll:**
```liquid
{% include file.html %}
```

**Hugo:**
```markdown
{{</* shortcode */>}}
```

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Book Theme](https://github.com/alex-shpak/hugo-book)
- [Hugo Shortcodes](https://gohugo.io/content-management/shortcodes/)
- [GitHub Actions for Hugo](https://gohugo.io/hosting-and-deployment/hosting-on-github/)

## Quick Commands Reference

```bash
# Install theme
git submodule add https://github.com/alex-shpak/hugo-book themes/hugo-book

# Serve locally
hugo server

# Build for production
hugo

# Create new content
hugo new content/page.md

# Clean build
rm -rf public/ resources/ && hugo

# Deploy (automatic via GitHub Actions)
git push
```

## Support

For issues:
1. Check Hugo version: `hugo version`
2. Review Hugo documentation
3. Check theme documentation
4. Review GitHub Actions logs
5. Open issue in repository
