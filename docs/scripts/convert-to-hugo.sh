#!/bin/bash
# Convert existing markdown files to Hugo format

set -e

echo "🔄 Converting documentation to Hugo format..."

# Function to convert front matter
convert_frontmatter() {
    local file=$1
    local temp_file="${file}.tmp"

    # Check if file has front matter
    if ! head -1 "$file" | grep -q "^---$"; then
        return
    fi

    echo "   Converting: $file"

    # Extract and convert front matter
    awk '
    BEGIN { in_fm=0; fm_done=0; weight=1 }
    /^---$/ {
        if (in_fm==0) {
            in_fm=1; print "---"; next
        } else {
            in_fm=0; fm_done=1
            if (title != "") print "title: \"" title "\""
            if (weight != "") print "weight: " weight
            print "bookToc: true"
            print "---"; next
        }
    }
    in_fm==1 {
        if (/^title:/) {
            title = gensub(/^title: *"?([^"]*)"?/, "\\1", "g")
        }
        if (/^nav_order:/) {
            weight = gensub(/^nav_order: */, "", "g")
        }
        # Skip Jekyll-specific fields
        if (/^layout:/) next
        if (/^permalink:/) next
        if (/^description:/) next
        if (/^parent:/) next
    }
    fm_done==1 { print }
    ' "$file" > "$temp_file"

    mv "$temp_file" "$file"
}

# Convert all markdown files in content/
if [ -d "content" ]; then
    find content -name "*.md" -type f | while read -r file; do
        convert_frontmatter "$file"
    done
    echo "✅ Front matter converted"
else
    echo "⚠️  No content directory found"
fi

# Convert relative links to Hugo relref
echo "🔗 Converting links to Hugo format..."

find content -name "*.md" -type f | while read -r file; do
    # Convert [text](page.md) to [text]({{< relref "page" >}})
    sed -i.bak -E 's/\[([^\]]+)\]\(([^)]+)\.md\)/[\1]({{< relref "\/\2" >}})/g' "$file"

    # Clean up backup files
    rm -f "${file}.bak"
done

echo "✅ Links converted"

echo ""
echo "✨ Conversion complete!"
echo ""
echo "Please review the changes before committing."
echo "Run 'hugo server' to test the site."
