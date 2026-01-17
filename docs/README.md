# Neovim4j Documentation

This directory contains the Hugo-based documentation for Neovim4j, designed to be published via GitHub Pages with automatic deployment.

## 🚀 Quick Start

### Prerequisites

- [Hugo](https://gohugo.io/installation/) (v0.100.0+)
- Git

### Setup

```bash
# Navigate to docs directory
cd docs/

# Run setup script (installs theme and sets up structure)
./scripts/setup-hugo.sh

# Start development server
hugo server

# Visit http://localhost:1313
```

## 📁 Structure

```
docs/
├── hugo.toml              # Hugo configuration
├── content/               # All markdown content
│   ├── _index.md          # Home page
│   ├── getting-started.md
│   ├── install.md
│   ├── quick-reference.md
│   └── tutorial/          # Tutorial lessons
│       ├── _index.md
│       ├── 01-project-setup.md
│       ├── 02-hello-world.md
│       └── ...
├── static/                # Static assets (images, etc.)
├── themes/                # Hugo themes
│   └── hugo-book/         # Hugo Book theme
├── scripts/               # Helper scripts
│   ├── setup-hugo.sh      # Initial setup
│   └── convert-to-hugo.sh # Convert markdown to Hugo format
└── public/                # Generated site (gitignored)
```

## 🛠️ Development

### Local Development

```bash
# Start server with live reload
hugo server

# With draft content
hugo server -D

# Build for production
hugo
```

### Creating Content

```bash
# Create new page
hugo new content/my-page.md

# Create new tutorial lesson
hugo new content/tutorial/11-new-lesson.md
```

### Front Matter Format

```yaml
---
title: "Page Title"
weight: 10           # Lower = appears first in menu
bookToc: true        # Show table of contents
bookCollapseSection: false
---
```

## 🚢 Deployment

### GitHub Actions (Automatic)

The site automatically deploys to GitHub Pages on every push to `main` that modifies the `docs/` directory.

**Workflow file:** `.github/workflows/hugo.yml`

**What happens:**
1. Push changes to `main` branch
2. GitHub Actions builds Hugo site from `docs/`
3. Site deploys to GitHub Pages
4. Available at: `https://yourusername.github.io/neovim4j/`

### Enable GitHub Pages

1. Go to repository **Settings**
2. Navigate to **Pages** section
3. Under **Source**, select: **GitHub Actions**
4. Save (no branch/folder selection needed with Actions)

### First Deployment

```bash
# Commit Hugo setup
git add .github/workflows/hugo.yml docs/
git commit -m "Add Hugo documentation with auto-deployment"
git push

# GitHub Actions will automatically build and deploy
# Check Actions tab to monitor progress
```

### Manual Deployment

```bash
# Trigger workflow manually
# Go to Actions tab → "Deploy Hugo site" → "Run workflow"
```

## 🎨 Hugo Book Theme

This documentation uses the [Hugo Book](https://github.com/alex-shpak/hugo-book) theme.

### Features

- Clean, minimal design
- Built-in search
- Mobile responsive
- Dark/light mode
- Collapsible menu
- Table of contents
- Shortcodes for callouts, tabs, buttons

### Shortcodes

**Hints/Callouts:**
```markdown
{{</* hint info */>}}
Info message
{{</* /hint */>}}

{{</* hint warning */>}}
Warning message
{{</* /hint */>}}
```

**Buttons:**
```markdown
{{</* button relref="/" */>}}Home{{</* /button */>}}
```

**Columns:**
```markdown
{{</* columns */>}}
Left content
<--->
Right content
{{</* /columns */>}}
```

**Tabs:**
```markdown
{{</* tabs "install" */>}}
{{</* tab "macOS" */>}} brew install {{</* /tab */>}}
{{</* tab "Linux" */>}} apt install {{</* /tab */>}}
{{</* /tabs */>}}
```

## 📝 Writing Content

### Menu Organization

Pages are ordered by `weight` (lower appears first):

```yaml
---
title: "First Page"
weight: 1
---
```

### Sections

Create `_index.md` in a directory:

```
content/
  tutorial/
    _index.md          # Tutorial section page
    01-lesson.md       # Lesson 1
    02-lesson.md       # Lesson 2
```

### Links

Use Hugo's `relref` for internal links:

```markdown
[Link text]({{</* relref "/page-name" */>}})
[Tutorial]({{</* relref "/tutorial" */>}})
```

### Code Blocks

```markdown
```java
public class Example {
    public static void main(String[] args) {
        System.out.println("Hello!");
    }
}
\```
```

## ⚙️ Configuration

### Site Settings

Edit `hugo.toml`:

```toml
baseURL = "https://yourusername.github.io/neovim4j/"
title = "Neovim4j"

[params]
  BookTheme = "dark"     # or "light", "auto"
  BookSearch = true      # Enable search
  BookToC = 3            # TOC depth
  BookRepo = "https://github.com/yourusername/neovim4j"
```

### Custom Styling

Create `static/custom.css`:

```css
:root {
  --body-background: #1a1a1a;
}
```

Reference in config:

```toml
[params]
  BookCustomCSS = ["custom.css"]
```

## 🔧 Helper Scripts

### Setup Script

```bash
./scripts/setup-hugo.sh
```

- Checks for Hugo installation
- Installs Hugo Book theme
- Sets up directory structure
- Creates sample content
- Tests build

### Conversion Script

```bash
./scripts/convert-to-hugo.sh
```

- Converts Jekyll front matter to Hugo format
- Updates internal links to use `relref`
- Migrates content to `content/` directory

## 🐛 Troubleshooting

### Build Fails

```bash
# Check Hugo version
hugo version

# Clear cache and rebuild
rm -rf public/ resources/ .hugo_build.lock
hugo
```

### Theme Not Found

```bash
# Install theme
git submodule add https://github.com/alex-shpak/hugo-book themes/hugo-book

# Update submodules
git submodule update --init --recursive
```

### Links Broken

- Use `relref` for internal links
- Check file paths in `content/`
- Verify front matter has `title`

### Search Not Working

Ensure in `hugo.toml`:
```toml
[params]
  BookSearch = true

[outputs]
  home = ["HTML", "RSS", "JSON"]
```

## 📚 Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Book Theme](https://github.com/alex-shpak/hugo-book)
- [Hugo Shortcodes](https://gohugo.io/content-management/shortcodes/)
- [GitHub Actions for Hugo](https://gohugo.io/hosting-and-deployment/hosting-on-github/)
- [Hugo Quick Start](https://gohugo.io/getting-started/quick-start/)

## 🤝 Contributing

### Adding Content

1. Create content file: `hugo new content/page.md`
2. Edit with proper front matter
3. Test locally: `hugo server`
4. Commit and push
5. GitHub Actions deploys automatically

### Workflow

```bash
# 1. Create/edit content
hugo new content/tutorial/new-lesson.md
vim content/tutorial/new-lesson.md

# 2. Test locally
hugo server

# 3. Build to verify
hugo

# 4. Commit and push
git add docs/content/
git commit -m "Add new tutorial lesson"
git push

# 5. GitHub Actions automatically deploys
```

## 📊 Deployment Status

Check deployment status:
- Visit **Actions** tab in GitHub
- Look for "Deploy Hugo site to GitHub Pages" workflow
- Green checkmark = successful deployment
- Red X = build failed (check logs)

## 📄 License

MIT License

---

For detailed Hugo setup instructions, see [HUGO_SETUP.md](HUGO_SETUP.md)
