# Hugo Documentation Deployment Guide

## Summary

Your Neovim4j documentation has been set up with:

1. ✅ **Hugo Static Site Generator** - Fast, modern documentation framework
2. ✅ **Hugo Book Theme** - Clean, searchable documentation theme
3. ✅ **GitHub Actions** - Automatic deployment on push
4. ✅ **Tutorial Structure** - 10-lesson interactive tutorial
5. ✅ **Helper Scripts** - Automated setup and conversion tools

## What Was Created

### Configuration Files

- **`docs/hugo.toml`** - Hugo site configuration
- **`.github/workflows/hugo.yml`** - GitHub Actions deployment workflow
- **`docs/.gitignore`** - Ignore Hugo build output

### Documentation Structure

```
docs/
├── hugo.toml              # Site config
├── content/               # Markdown content (to be created)
│   ├── _index.md          # Home page
│   ├── getting-started.md
│   ├── install.md
│   ├── quick-reference.md
│   └── tutorial/          # Tutorial lessons
├── static/                # Images, assets (to be created)
├── themes/                # Hugo themes (to be installed)
└── scripts/               # Helper scripts
    ├── setup-hugo.sh      # Setup automation
    └── convert-to-hugo.sh # Content migration
```

### Documentation Files

- **`docs/README.md`** - Hugo documentation overview
- **`docs/HUGO_SETUP.md`** - Detailed setup guide

## Quick Setup (3 Steps)

### 1. Install Hugo Theme

```bash
cd docs/

# Run the automated setup script
./scripts/setup-hugo.sh

# This will:
# - Check Hugo installation
# - Install Hugo Book theme
# - Set up directory structure
# - Migrate content to content/
```

### 2. Test Locally

```bash
# Start Hugo development server
hugo server

# Visit: http://localhost:1313
```

### 3. Deploy to GitHub Pages

```bash
# Commit all files
git add .
git commit -m "Setup Hugo documentation with GitHub Actions"
git push

# GitHub Actions will automatically:
# 1. Detect changes in docs/
# 2. Build the Hugo site
# 3. Deploy to GitHub Pages
```

## GitHub Pages Setup

### Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under **Source**, select: **GitHub Actions**
4. Click **Save**

That's it! No need to select a branch or folder - GitHub Actions handles everything.

### Access Your Site

After first deployment:
- **URL**: `https://yourusername.github.io/neovim4j/`
- **Build time**: ~2-3 minutes
- **Updates**: Automatic on every push to `docs/`

## Development Workflow

### Typical Workflow

```bash
# 1. Edit documentation
cd docs/
vim content/tutorial/new-lesson.md

# 2. Test locally
hugo server

# 3. Build to verify
hugo

# 4. Commit and push
git add docs/
git commit -m "Add new tutorial lesson"
git push

# 5. GitHub Actions deploys automatically
#    Check progress: GitHub → Actions tab
```

### Creating New Content

```bash
# Create new page
hugo new content/page-name.md

# Create new tutorial lesson
hugo new content/tutorial/11-advanced-topics.md

# Edit the file
vim content/tutorial/11-advanced-topics.md
```

## Current vs Hugo Structure

### Migration Needed

Your current markdown files in `docs/` need to be moved to `docs/content/`:

**Current:**
```
docs/
├── getting-started.md     # ← Needs to move
├── install.md             # ← Needs to move
├── quick-reference.md     # ← Needs to move
└── tutorial/
    ├── *.md              # ← Needs to move
```

**After migration:**
```
docs/
├── hugo.toml
├── content/              # ← All content goes here
│   ├── _index.md
│   ├── getting-started.md
│   ├── install.md
│   ├── quick-reference.md
│   └── tutorial/
│       ├── _index.md
│       └── *.md
└── themes/
    └── hugo-book/
```

### Automated Migration

Run the setup script:

```bash
cd docs/
./scripts/setup-hugo.sh
```

This automatically:
- Moves files to `content/`
- Creates backups in `_backup/`
- Converts front matter to Hugo format
- Sets up theme

## GitHub Actions Details

### Workflow Configuration

**File**: `.github/workflows/hugo.yml`

**Triggers**:
- Push to `main` branch
- Only when `docs/**` changes
- Manual workflow dispatch

**Process**:
1. Checkout code with submodules
2. Install Hugo CLI
3. Build site from `docs/` directory
4. Upload artifact
5. Deploy to GitHub Pages

### Working Directory

The workflow runs with `working-directory: docs`, ensuring:
- ✅ Only `docs/` is built
- ✅ Changes outside `docs/` are ignored
- ✅ Hugo commands run in correct directory

### Monitoring Deployments

**Check deployment status**:
1. Go to **Actions** tab
2. Look for "Deploy Hugo site to GitHub Pages"
3. Green ✓ = Success
4. Red ✗ = Failed (click to see logs)

**Common issues**:
- Theme not installed (run setup script)
- Invalid TOML syntax in `hugo.toml`
- Missing front matter in markdown files

## Hugo Book Theme Features

### What You Get

- **Search**: Full-text search across all pages
- **Dark mode**: Built-in dark/light theme switcher
- **Mobile responsive**: Works on all devices
- **Collapsible menu**: Organize content hierarchically
- **Table of contents**: Auto-generated from headings
- **Edit links**: Direct links to GitHub for editing

### Shortcodes Available

**Callouts**:
```markdown
{{</* hint info */>}}
This is an info message
{{</* /hint */>}}

{{</* hint warning */>}}
Warning message
{{</* /hint */>}}

{{</* hint danger */>}}
Danger message
{{</* /hint */>}}
```

**Buttons**:
```markdown
{{</* button relref="/" */>}}Home{{</* /button */>}}
{{</* button href="https://github.com" */>}}GitHub{{</* /button */>}}
```

**Columns**:
```markdown
{{</* columns */>}}
Left column
<--->
Right column
{{</* /columns */>}}
```

**Tabs**:
```markdown
{{</* tabs "unique-id" */>}}
{{</* tab "macOS" */>}} macOS instructions {{</* /tab */>}}
{{</* tab "Linux" */>}} Linux instructions {{</* /tab */>}}
{{</* /tabs */>}}
```

## Customization

### Update Site URL

Edit `docs/hugo.toml`:

```toml
baseURL = "https://yourusername.github.io/neovim4j/"
#              ^^^^^^^^^^^^                ^^^^^^^^
#              Your GitHub                 Your repo
#              username                    name
```

### Update Repository Link

```toml
[params]
  BookRepo = "https://github.com/yourusername/neovim4j"
```

### Theme Settings

```toml
[params]
  BookTheme = "dark"      # Options: "dark", "light", "auto"
  BookSearch = true       # Enable search
  BookToC = 3             # Table of contents depth
```

## Troubleshooting

### Hugo Not Installed

```bash
# macOS
brew install hugo

# Linux (Debian/Ubuntu)
sudo apt-get install hugo

# Or download from: https://github.com/gohugoio/hugo/releases
```

### Theme Not Found

```bash
cd docs/

# Install theme
git submodule add https://github.com/alex-shpak/hugo-book themes/hugo-book

# Or run setup script
./scripts/setup-hugo.sh
```

### Build Fails on GitHub Actions

1. Check Actions logs for specific error
2. Verify `hugo.toml` syntax (valid TOML)
3. Ensure all content has proper front matter
4. Check theme is committed (if not using submodule)

### Changes Not Appearing

1. Ensure you pushed to `main` branch
2. Check Actions completed successfully
3. Clear browser cache
4. Wait 2-3 minutes for deployment

## Next Steps

1. **Run setup**: `cd docs/ && ./scripts/setup-hugo.sh`
2. **Test locally**: `hugo server`
3. **Customize**: Edit `hugo.toml` with your details
4. **Commit**: `git add . && git commit -m "Setup Hugo" && git push`
5. **Enable Pages**: Settings → Pages → GitHub Actions
6. **Monitor**: Actions tab to watch deployment

## Resources

- **Hugo Docs**: https://gohugo.io/documentation/
- **Hugo Book Theme**: https://github.com/alex-shpak/hugo-book
- **GitHub Actions**: https://docs.github.com/actions
- **GitHub Pages**: https://docs.github.com/pages

## Support

For issues:
1. Check `docs/HUGO_SETUP.md` for detailed instructions
2. Review Hugo documentation
3. Check GitHub Actions logs
4. Verify theme installation

---

**Ready to deploy?** Run `./scripts/setup-hugo.sh` to get started!
