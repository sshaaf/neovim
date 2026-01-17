#!/bin/bash
# Setup script for Hugo documentation

set -e

echo "🚀 Setting up Hugo documentation for Neovim4j..."

# Check if we're in the right directory
if [ ! -f "hugo.toml" ]; then
    echo "❌ Error: hugo.toml not found. Please run this script from the docs/ directory."
    exit 1
fi

# Check if Hugo is installed
if ! command -v hugo &> /dev/null; then
    echo "❌ Hugo is not installed!"
    echo ""
    echo "Please install Hugo first:"
    echo "  macOS:   brew install hugo"
    echo "  Linux:   sudo apt-get install hugo"
    echo "  Windows: choco install hugo-extended"
    echo ""
    echo "Or visit: https://gohugo.io/installation/"
    exit 1
fi

echo "✅ Hugo found: $(hugo version)"

# Install theme if not present
if [ ! -d "themes/hugo-book" ]; then
    echo "📦 Installing Hugo Book theme..."

    if [ -d "../.git" ]; then
        # We're in a git repository, use submodule
        echo "   Using git submodule..."
        cd ..
        git submodule add https://github.com/alex-shpak/hugo-book docs/themes/hugo-book
        git submodule update --init --recursive
        cd docs
    else
        # Not in a git repo, just clone
        echo "   Cloning theme..."
        git clone https://github.com/alex-shpak/hugo-book themes/hugo-book
    fi

    echo "✅ Theme installed"
else
    echo "✅ Theme already installed"
fi

# Ensure content directory structure exists
echo "📁 Setting up content structure..."
mkdir -p content/tutorial
mkdir -p static
mkdir -p layouts

echo "✅ Directory structure ready"

# Check if content files need migration
if [ ! -f "content/_index.md" ] && [ -f "index.md" ]; then
    echo "📝 Migrating content files to Hugo structure..."

    # Backup old structure
    mkdir -p _backup
    cp -r *.md _backup/ 2>/dev/null || true

    # Move files to content directory
    mv index.md content/_index.md 2>/dev/null || true
    mv getting-started.md content/ 2>/dev/null || true
    mv install.md content/ 2>/dev/null || true
    mv quick-reference.md content/ 2>/dev/null || true

    # Move tutorial files
    if [ -d "tutorial" ]; then
        mv tutorial/*.md content/tutorial/ 2>/dev/null || true
    fi

    echo "✅ Content migrated (backup in _backup/)"
fi

# Create a sample page if content is empty
if [ ! -f "content/_index.md" ]; then
    echo "📝 Creating sample home page..."
    cat > content/_index.md << 'EOF'
---
title: "Neovim4j"
type: docs
---

# Neovim4j

Welcome to Neovim4j documentation!

This is a sample page. Edit `content/_index.md` to customize.
EOF
    echo "✅ Sample page created"
fi

# Test build
echo "🔨 Testing Hugo build..."
if hugo --quiet; then
    echo "✅ Build successful!"
else
    echo "❌ Build failed. Please check your content files."
    exit 1
fi

# Clean build output
rm -rf public/
echo "🧹 Cleaned build output"

echo ""
echo "✨ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Run: hugo server"
echo "  2. Visit: http://localhost:1313"
echo "  3. Edit content in: content/"
echo ""
echo "To deploy:"
echo "  git add ."
echo "  git commit -m 'Setup Hugo documentation'"
echo "  git push"
echo ""
echo "GitHub Actions will automatically build and deploy to GitHub Pages!"
