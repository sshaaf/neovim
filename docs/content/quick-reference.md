---
title: "Quick Reference"
weight: 4
bookToc: true
---

# Development Quick Reference

## Essential Keybindings

### Common (All Languages)

### File Navigation
| Key | Action |
|-----|--------|
| `<Space>ne` | Toggle file explorer |
| `<Space>fp` | Find files |
| `<Space>fr` | Recent files |
| `<Space>fs` | Search in files (grep) |
| `<Space>fb` | Switch buffers |

### UI Customization
| Key | Action |
|-----|--------|
| `<Space>ct` | Change colorscheme/theme (live preview) |

### Code Navigation
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `gr` or `gR` | Find references |
| `K` | Show documentation |

### Code Editing
| Key | Action |
|-----|--------|
| `<Space>ca` | Code actions (generate, imports, etc) |
| `<Space>rn` | Rename symbol |
| `<C-Space>` | Trigger completion |
| `<C-j>` | Next completion item |
| `<C-k>` | Previous completion item |
| `<CR>` | Accept completion |

### Diagnostics (Errors/Warnings)
| Key | Action |
|-----|--------|
| `<Space>D` | Show all diagnostics in file |
| `<Space>d` | Show diagnostic on current line |
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |
| `<Space>rs` | Restart LSP |

### Testing (Java)
| Command | Action |
|---------|--------|
| `:!mvn test` | Run all tests (Maven) |
| `:!mvn test -Dtest=ClassName` | Run specific test class |
| `:!gradle test` | Run all tests (Gradle) |

### Rust-Specific
| Key | Action |
|-----|--------|
| `<Space>cR` | Rust code actions |
| `<Space>dr` | Rust debuggables |

### Cargo.toml (crates.nvim)
When editing Cargo.toml files:
- Hover over dependencies for version info and documentation
- Code completion for crate names
- Inline diagnostics for outdated versions

### Debugging
| Key | Action |
|-----|--------|
| `<Space>db` | Toggle breakpoint |
| `<Space>dc` | Continue/Start |
| `<Space>dn` | Step over |
| `<Space>di` | Step into |
| `<Space>do` | Step out |

### Buffer Management
| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `:bd` | Close buffer |

### Terminal
| Key | Action |
|-----|--------|
| `<C-7>` | Toggle terminal |
| `<C-\><C-n>` | Exit terminal mode |
| `i` | Enter terminal mode |
| `<Space>gb` | Run Gradle build |
| `<Space>gc` | Run Gradle compile |
| `<Space>gg` | Open Lazygit |

### AI (CodeCompanion with Ollama)
| Key | Action |
|-----|--------|
| `<Space>ac` | Open AI chat |
| `<Space>ae` | Edit selection with AI (visual) |
| `<Space>ax` | Explain code (visual) |
| `<Space>aa` | Show AI actions menu |
| `<Space>at` | Toggle AI chat window |

## Vim Essentials

### Modes
- `Esc` - Normal mode
- `i` - Insert mode (before cursor)
- `a` - Insert mode (after cursor)
- `v` - Visual mode
- `:` - Command mode

### Navigation
- `h/j/k/l` - Left/Down/Up/Right
- `w` - Next word
- `b` - Previous word
- `gg` - Top of file
- `G` - Bottom of file
- `0` - Start of line
- `$` - End of line

### Editing
- `dd` - Delete line
- `yy` - Copy line
- `p` - Paste
- `u` - Undo
- `<C-r>` - Redo
- `o` - New line below
- `O` - New line above

### File Operations
- `:w` - Save
- `:q` - Quit
- `:wq` - Save and quit
- `:q!` - Quit without saving

## Common Workflows

### Java Workflows

#### Create New Class
1. `<Space>ne` - Open file explorer
2. Navigate to package directory
3. `a` - Create new file
4. Type `ClassName.java`

#### Fix Errors
1. `]d` - Jump to error
2. `<Space>d` - See error details
3. `<Space>ca` - View quick fixes
4. Select and apply fix

### Rust Workflows

#### Create New Rust Module
1. `<Space>ne` - Open file explorer
2. Navigate to src directory
3. `a` - Create new file
4. Type `module_name.rs`

#### Add Dependencies (Cargo.toml)
1. Open `Cargo.toml`
2. Start typing crate name under `[dependencies]`
3. Use completion to select crate
4. Auto-complete will suggest latest version

#### Run Rust Debuggables
1. `<Space>dr` - Open debuggables menu
2. Select test, binary, or example to debug
3. Debugger will start automatically

### General Workflows

#### Refactor/Rename
1. Place cursor on symbol
2. `<Space>rn` - Rename
3. Type new name
4. Enter to confirm

#### Navigate Unknown Code
1. `gd` - Go to definition
2. `K` - Read documentation
3. `gr` - See where it's used
4. `<Space>ch` - Call hierarchy

## File Explorer (nvim-tree)
- `Enter` - Open file/folder
- `a` - Create new file/folder
- `d` - Delete
- `r` - Rename
- `R` - Refresh
- `q` - Close
- `?` - Help

## Tips
- Leader key is `<Space>`
- Use `:Mason` to manage LSP servers
- Use `:Lazy` to manage plugins
- Use `:checkhealth` to diagnose issues
- Use `:help <topic>` for help

---
For detailed guide, see [Getting Started]({{< relref "/getting-started" >}})
