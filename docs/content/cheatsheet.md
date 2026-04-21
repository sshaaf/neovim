---
title: "Cheatsheet"
weight: 3
bookToc: true
---

# Neovim4J Complete Cheatsheet

**Leader key:** `<Space>` (Space bar)

## Quick Help Access

When you forget a keybinding, use any of these methods:

| Key | Action |
|-----|--------|
| `<Space>` (wait 500ms) | Show all keybindings automatically |
| `<Space>?` | Show all keybindings (which-key popup) |
| `<Space><Space>` | Show all keybindings (which-key popup) |
| `<Space>ck` | Toggle persistent keymaps sidebar (right panel) |
| `<Space>cs` | Open searchable cheatsheet (Telescope) |

## Vim Essentials

### Modes

| Key | Mode |
|-----|------|
| `Esc` | Normal mode (exit any mode) |
| `i` | Insert mode (before cursor) |
| `a` | Insert mode (after cursor) |
| `I` | Insert mode (start of line) |
| `A` | Insert mode (end of line) |
| `v` | Visual mode (character selection) |
| `V` | Visual line mode |
| `<C-v>` | Visual block mode |
| `:` | Command mode |

### Basic Navigation

| Key | Action |
|-----|--------|
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `w` | Jump to next word |
| `b` | Jump to previous word |
| `e` | Jump to end of word |
| `0` | Jump to start of line |
| `^` | Jump to first non-blank character |
| `$` | Jump to end of line |
| `gg` | Jump to top of file |
| `G` | Jump to bottom of file |
| `{` | Jump to previous paragraph |
| `}` | Jump to next paragraph |
| `%` | Jump to matching bracket |
| `<C-d>` | Scroll down half page |
| `<C-u>` | Scroll up half page |
| `<C-f>` | Scroll down full page |
| `<C-b>` | Scroll up full page |

### Basic Editing

| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `o` | Open new line below |
| `O` | Open new line above |
| `x` | Delete character (no copy) |
| `dd` | Delete line |
| `yy` | Yank (copy) line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `<C-r>` | Redo |
| `.` | Repeat last change |
| `~` | Toggle case |
| `>>` | Indent line |
| `<<` | Unindent line |
| `==` | Auto-indent line |

### Search & Replace

| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor (forward) |
| `#` | Search word under cursor (backward) |
| `<Space>nh` | Clear search highlights |
| `:s/old/new/` | Replace first occurrence in line |
| `:s/old/new/g` | Replace all in line |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirmation |

### File Operations

| Command | Action |
|---------|--------|
| `:w` | Save file |
| `:w filename` | Save as filename |
| `:q` | Quit |
| `:q!` | Quit without saving |
| `:wq` or `:x` | Save and quit |
| `:qa` | Quit all windows |
| `:wa` | Save all files |
| `:e filename` | Edit file |
| `:bd` | Close buffer |

## File Explorer (nvim-tree)

### Opening File Explorer

| Key | Action |
|-----|--------|
| `<Space>ne` | Toggle file explorer |
| `<Space>nf` | Toggle file explorer on current file |
| `<Space>nc` | Collapse file explorer |
| `<Space>nr` | Refresh file explorer |

### Inside File Explorer

| Key | Action |
|-----|--------|
| `Enter` or `o` | Open file/folder |
| `a` | Create new file/folder |
| `d` | Delete file/folder |
| `r` | Rename file/folder |
| `x` | Cut file/folder |
| `c` | Copy file/folder |
| `p` | Paste file/folder |
| `R` | Refresh |
| `H` | Toggle hidden files |
| `q` | Close explorer |
| `?` | Show help |
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `<C-t>` | Open in new tab |

## File Finding (Telescope)

| Key | Action |
|-----|--------|
| `<Space>ff` | Find files in current directory |
| `<Space>fp` | Find files (same as ff) |
| `<Space>fr` | Find recent files |
| `<Space>fs` | Live grep (search in files) |
| `<Space>fw` | Find word under cursor |
| `<Space>ct` | Change colorscheme/theme (with live preview) |

### Inside Telescope

| Key | Action |
|-----|--------|
| `<C-j>` | Move to next result |
| `<C-k>` | Move to previous result |
| `<C-n>` | Create new file from prompt |
| `<C-q>` | Send selected to quickfix list |
| `Enter` | Select item |
| `Esc` | Close Telescope |

## LSP & Code Navigation

### Go To Navigation

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `gr` or `gR` | Find references |
| `K` | Show hover documentation |

### Code Actions & Refactoring

| Key | Action |
|-----|--------|
| `<Space>ca` | Show code actions |
| `<Space>rn` | Rename symbol |
| `<Space>rs` | Restart LSP server |

### Diagnostics (Errors & Warnings)

| Key | Action |
|-----|--------|
| `<Space>D` | Show all diagnostics in buffer |
| `<Space>d` | Show diagnostic on current line |
| `]d` | Go to next diagnostic |
| `[d` | Go to previous diagnostic |

## Autocompletion (nvim-cmp)

| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger completion manually |
| `<C-j>` | Next completion item |
| `<C-k>` | Previous completion item |
| `<CR>` (Enter) | Accept completion |
| `<C-e>` | Close completion menu |

## Window Management

### Window Splits

| Key | Action |
|-----|--------|
| `<Space>sv` | Split window vertically |
| `<Space>sh` | Split window horizontally |
| `<Space>se` | Make splits equal size |
| `<Space>sx` | Close current split |

### Window Navigation

| Key | Action |
|-----|--------|
| `<Space>h` | Move cursor to left window |
| `<Space>j` | Move cursor to bottom window |
| `<Space>k` | Move cursor to top window |
| `<Space>l` | Move cursor to right window |
| `<C-w>w` | Cycle through windows |
| `<C-w>h/j/k/l` | Move to left/down/up/right window |

### Window Resizing

| Key | Action |
|-----|--------|
| `<C-w>+` | Increase height |
| `<C-w>-` | Decrease height |
| `<C-w>>` | Increase width |
| `<C-w><` | Decrease width |
| `<C-w>=` | Make all equal size |

## Tab Management

| Key | Action |
|-----|--------|
| `<Space>to` | Open new tab |
| `<Space>tx` | Close current tab |
| `<Space>tn` | Go to next tab |
| `<Space>tp` | Go to previous tab |
| `<Space>tf` | Open current buffer in new tab |
| `gt` | Next tab (Vim default) |
| `gT` | Previous tab (Vim default) |
| `1gt` | Go to tab 1 |
| `2gt` | Go to tab 2 |

## Buffer Management

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `:bn` | Next buffer |
| `:bp` | Previous buffer |
| `:bd` | Close/delete buffer |
| `:ls` | List all buffers |
| `:b<number>` | Go to buffer number |
| `:b <name>` | Go to buffer by name (partial match) |

## Clipboard Operations

| Key | Action |
|-----|--------|
| `<C-c>` | Copy to system clipboard (visual mode) |
| `"+y` | Yank to system clipboard |
| `"+p` | Paste from system clipboard |
| `"*y` | Yank to selection clipboard (Linux) |
| `"*p` | Paste from selection clipboard (Linux) |

## Git Integration (Lazygit)

| Key | Action |
|-----|--------|
| `<Space>gg` | Open Lazygit TUI |

### Inside Lazygit

| Key | Action |
|-----|--------|
| `Space` | Stage/unstage file |
| `a` | Stage all files |
| `c` | Commit |
| `P` | Push |
| `p` | Pull |
| `]` | Next tab |
| `[` | Previous tab |
| `q` | Quit |
| `?` | Show help |

## Terminal

| Key | Action |
|-----|--------|
| `<C-7>` | Toggle floating terminal |
| `<C-\><C-n>` | Exit terminal mode to normal mode |
| `i` or `a` | Enter terminal mode |

## AI Assistant (CodeCompanion with Ollama)

| Key | Action | Mode |
|-----|--------|------|
| `<Space>ac` | Open AI chat | Normal/Visual |
| `<Space>ae` | Edit selection with AI | Visual |
| `<Space>ax` | Explain code | Visual |
| `<Space>aa` | Show AI actions menu | Normal/Visual |
| `<Space>at` | Toggle AI chat window | Normal |

### AI Chat Commands

Inside the AI chat, you can use:
- `/explain` - Explain selected code
- `/fix` - Fix issues in code
- `/refactor` - Refactor code
- Type naturally to chat with AI

## Rust-Specific Commands

| Key | Action |
|-----|--------|
| `<Space>cR` | Rust code actions |
| `<Space>dr` | Rust debuggables (run/debug tests) |

### Cargo.toml (crates.nvim)

When editing `Cargo.toml`:
- Hover over dependencies for version info and docs
- Inline diagnostics for outdated versions
- Code completion for crate names
- Automatic version suggestions

### Common Rust Commands

| Command | Action |
|---------|--------|
| `:!cargo build` | Build project |
| `:!cargo run` | Run project |
| `:!cargo test` | Run tests |
| `:!cargo check` | Check for errors |
| `:!cargo clippy` | Run clippy linter |
| `:!cargo fmt` | Format code |

## Java Development

### Running Tests

| Command | Action |
|---------|--------|
| `:!mvn test` | Run all Maven tests |
| `:!mvn test -Dtest=ClassName` | Run specific test class |
| `:!gradle test` | Run all Gradle tests |
| `:!gradle test --tests ClassName` | Run specific test class |

### Build Commands

| Command | Action |
|---------|--------|
| `:!mvn compile` | Compile Maven project |
| `:!mvn package` | Package Maven project |
| `:!gradle build` | Build Gradle project |
| `:!gradle compileJava` | Compile Java sources |

## Plugin Management

### Lazy.nvim (Plugin Manager)

| Command | Action |
|---------|--------|
| `:Lazy` | Open Lazy plugin manager |
| `:Lazy update` | Update all plugins |
| `:Lazy sync` | Sync plugins (install/update/clean) |
| `:Lazy clean` | Clean unused plugins |
| `:Lazy check` | Check for updates |

### Mason (LSP/Tool Manager)

| Command | Action |
|---------|--------|
| `:Mason` | Open Mason UI |
| `:MasonUpdate` | Update Mason registry |
| `:MasonInstall <name>` | Install tool/LSP |
| `:MasonUninstall <name>` | Uninstall tool/LSP |

## Debugging (DAP)

| Key | Action |
|-----|--------|
| `<Space>db` | Toggle breakpoint |
| `<Space>dc` | Continue/Start debugging |
| `<Space>dn` | Step over |
| `<Space>di` | Step into |
| `<Space>do` | Step out |

## Treesitter

### Text Objects (Treesitter)

| Key | Action |
|-----|--------|
| `vaf` | Select outer function |
| `vif` | Select inner function |
| `vac` | Select outer class |
| `vic` | Select inner class |
| `va{` | Select outer block |
| `vi{` | Select inner block |

## Health & Diagnostics

| Command | Action |
|---------|--------|
| `:checkhealth` | Check Neovim health |
| `:checkhealth <plugin>` | Check specific plugin health |
| `:messages` | Show message history |
| `:LspInfo` | Show LSP client info |
| `:LspLog` | Open LSP log |

## Miscellaneous

| Command | Action |
|---------|--------|
| `:help <topic>` | Open help for topic |
| `:help keymaps` | Help for keymaps |
| `:map` | Show all mappings |
| `:nmap` | Show normal mode mappings |
| `:vmap` | Show visual mode mappings |
| `:verbose map <key>` | Show where key was mapped |
| `:source %` | Reload current file |
| `:!<command>` | Run shell command |
| `:read !<command>` | Read command output into buffer |

## Useful Vim Motions

### Text Objects

Combine with operators (`d`, `c`, `y`, `v`):

| Motion | Action |
|--------|--------|
| `iw` | Inner word |
| `aw` | A word (with space) |
| `is` | Inner sentence |
| `as` | A sentence |
| `ip` | Inner paragraph |
| `ap` | A paragraph |
| `i"` | Inside double quotes |
| `a"` | Around double quotes |
| `i'` | Inside single quotes |
| `a'` | Around single quotes |
| `i(` or `i)` | Inside parentheses |
| `a(` or `a)` | Around parentheses |
| `i{` or `i}` | Inside braces |
| `a{` or `a}` | Around braces |
| `i[` or `i]` | Inside brackets |
| `a[` or `a]` | Around brackets |
| `it` | Inside tag (HTML/XML) |
| `at` | Around tag (HTML/XML) |

### Examples

| Command | Action |
|---------|--------|
| `diw` | Delete inner word |
| `ci"` | Change inside quotes |
| `da(` | Delete around parentheses |
| `yi{` | Yank inside braces |
| `vit` | Select inside tag |

### Operators

| Key | Action |
|-----|--------|
| `d` | Delete |
| `c` | Change (delete and enter insert) |
| `y` | Yank (copy) |
| `v` | Visual select |
| `>` | Indent |
| `<` | Unindent |
| `=` | Auto-indent |

### Counts & Repeats

| Example | Action |
|---------|--------|
| `3dd` | Delete 3 lines |
| `5j` | Move down 5 lines |
| `2w` | Move 2 words forward |
| `4>>` | Indent 4 lines |
| `3p` | Paste 3 times |

## Tips & Workflows

### Creating New Files

**Via File Explorer:**
1. `<Space>ne` - Open file explorer
2. Navigate to directory
3. `a` - Create new file
4. Type filename and press Enter

**Via Telescope:**
1. `<Space>ff` - Open file finder
2. Type new filename
3. `<C-n>` - Create file

### Fixing Code Errors

1. `]d` - Jump to next error
2. `<Space>d` - View error details
3. `<Space>ca` - View code actions
4. Select and apply fix

### Refactoring

1. Place cursor on symbol
2. `<Space>rn` - Rename
3. Type new name
4. Press Enter

### Navigating Unknown Code

1. `gd` - Go to definition
2. `K` - Read hover documentation
3. `gr` - See all references
4. `<C-o>` - Jump back to previous location

### Search & Replace Workflow

1. `/pattern` - Find pattern
2. `n` - Navigate to next match
3. `cgn` - Change next match
4. `.` - Repeat change on next match
5. `<Space>nh` - Clear highlights when done

### Multi-Cursor Editing (Substitute)

1. `:%s/old/new/gc` - Replace with confirmation
2. `y` - Yes, replace this
3. `n` - No, skip this
4. `a` - Replace all remaining
5. `q` - Quit

### Working with Multiple Files

1. `<Space>ff` - Find files
2. Open first file
3. `<Space>sv` - Split vertically
4. `<Space>l` - Move to right window
5. `<Space>ff` - Find second file

### Debugging Workflow

1. `<Space>db` - Set breakpoints
2. `<Space>dr` - Start debugger (Rust) or use language-specific command
3. `<Space>dc` - Continue execution
4. `<Space>dn` - Step over
5. `<Space>di` - Step into

---

## Remember

- **Leader key is `<Space>`** - Press and wait to see all available commands
- Use `<Space>ck` for a persistent cheatsheet sidebar
- Use `<Space>cs` for searchable cheatsheet via Telescope
- Use `<Space>?` or `<Space><Space>` for which-key popup
- Most actions can be undone with `u`
- `:help <topic>` is your friend
- `q` usually closes popup windows

For more details, see:
- [Getting Started Guide]({{< relref "/getting-started" >}})
- [Quick Reference]({{< relref "/quick-reference" >}})
- [Plugin Documentation]({{< relref "/plugins" >}})
