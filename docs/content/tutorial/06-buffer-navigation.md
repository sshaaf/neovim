---
title: "Lesson 6: Buffer Navigation"
weight: 60
bookToc: true
---

# Lesson 6: Buffer Navigation

In this lesson, you'll learn to efficiently work with multiple files (buffers) open simultaneously in Neovim.

## Learning Objectives

By the end of this lesson, you'll be able to:
- Understand buffers, windows, and tabs
- Switch between open files quickly
- Split windows horizontally and vertically
- Navigate between splits
- Manage buffer lifecycle

## Understanding Buffers, Windows, and Tabs

### Buffers
A **buffer** is an in-memory representation of a file. When you open a file, it loads into a buffer.

### Windows
A **window** is a viewport displaying a buffer. You can have multiple windows showing different buffers (or the same buffer).

### Tabs
A **tab** is a collection of windows. Think of tabs as different workspace layouts.

```
Tab 1: [Window1: buffer1] [Window2: buffer2]
Tab 2: [Window1: buffer3]
```

## Opening Multiple Files

### Open files one by one:

```vim
:e src/main/java/com/example/User.java
:e src/main/java/com/example/UserService.java
:e src/main/java/com/example/Main.java
```

Each `:e` command opens a file in a new buffer.

### Or open multiple from command line:

```bash
nvim file1.java file2.java file3.java
```

### Or using fuzzy finder:

Press `<Space>ff`, select a file, press `Enter`. Repeat for more files.

## Switching Between Buffers

### Using Buffer Navigation Keys

| Key | Action |
|-----|--------|
| `<Space>bb` | Show buffer picker |
| `]b` | Next buffer |
| `[b` | Previous buffer |
| `:b <name>` | Switch to buffer by name |
| `:b <number>` | Switch to buffer by number |

### Using Telescope Buffer Picker

Press `<Space>bb` to see all open buffers:
- Type to filter
- `<Enter>` to switch
- `<Ctrl-x>` to delete buffer

### Quick Switch

Jump directly to a buffer:
```vim
:b User         " Partial name matches
:b UserService
```

Press `Tab` for auto-completion.

## Window Splits

### Creating Splits

| Key | Action |
|-----|--------|
| `<Space>sv` | Split window vertically |
| `<Space>sh` | Split window horizontally |
| `:split` or `:sp` | Horizontal split |
| `:vsplit` or `:vs` | Vertical split |

### Example Layout

```vim
:vsplit        " Vertical split (left|right)
:split         " Horizontal split (top|bottom)
```

Results in:
```
┌────────┬────────┐
│        │        │
│ Buffer1│ Buffer2│
│        ├────────┤
│        │ Buffer3│
└────────┴────────┘
```

### Navigating Between Splits

| Key | Action |
|-----|--------|
| `<Ctrl-h>` | Move to left split |
| `<Ctrl-j>` | Move to split below |
| `<Ctrl-k>` | Move to split above |
| `<Ctrl-l>` | Move to right split |

**Tip**: This uses `vim-tmux-navigator`, so it works seamlessly with tmux too.

### Resizing Splits

| Key | Action |
|-----|--------|
| `<Ctrl-Up>` | Increase height |
| `<Ctrl-Down>` | Decrease height |
| `<Ctrl-Left>` | Decrease width |
| `<Ctrl-Right>` | Increase width |
| `<Ctrl-w>=` | Equalize all splits |

### Closing Splits

| Key | Action |
|-----|--------|
| `<Space>sx` | Close current split |
| `:q` | Close current window |
| `:only` | Close all but current window |

## Practical Workflow Example

Let's work with a multi-file Java project:

### Scenario: Editing User Management Feature

1. **Open main files:**
   ```bash
   nvim src/main/java/com/example/Main.java
   ```

2. **Open related files:**
   - `<Space>ff` → type "User.java" → `Enter`
   - `<Space>ff` → type "UserService" → `Enter`
   - `<Space>ff` → type "UserController" → `Enter`

3. **Arrange workspace:**
   - `<Space>sv` - Split vertically
   - `<Ctrl-l>` - Move to right split
   - `<Space>bb` - Pick `UserService.java`
   - `<Space>sh` - Split horizontally
   - `<Ctrl-j>` - Move down
   - `<Space>bb` - Pick `User.java`

   Now you have:
   ```
   ┌─────────────┬─────────────┐
   │   Main.java │UserServ.java│
   │             ├─────────────┤
   │             │  User.java  │
   └─────────────┴─────────────┘
   ```

4. **Navigate while editing:**
   - Edit Main.java, use `gd` on `UserService` → jumps to definition
   - `<Ctrl-o>` - Jump back to Main.java
   - `<Ctrl-h>` - Move to Main.java split
   - `<Ctrl-l>` - Move to service/model splits

5. **Close when done:**
   - `<Space>sx` - Close splits one by one
   - Or `:only` - Keep only current split

## Buffer Management

### Listing Buffers

```vim
:ls
```

Shows:
```
  1  h   "Main.java"
  2 %a   "UserService.java"
  3  a   "User.java"
```

Flags:
- `%` - current buffer
- `#` - alternate buffer (previous)
- `a` - active (loaded and displayed)
- `h` - hidden (loaded but not displayed)

### Closing Buffers

| Command | Action |
|---------|--------|
| `:bd` | Delete current buffer |
| `:bd <name>` | Delete specific buffer |
| `:%bd` | Delete all buffers |
| `:bd!` | Force delete (discard changes) |

### Saving and Closing

| Command | Action |
|---------|--------|
| `:w` | Write (save) current buffer |
| `:wa` | Write all buffers |
| `:wq` | Write and quit |
| `:qa` | Quit all |
| `:wqa` | Write all and quit |
| `:qa!` | Quit all without saving |

## Advanced Buffer Workflows

### The Alternate Buffer

Neovim remembers your previous buffer:

```vim
<Ctrl-^>        " Switch to alternate (previous) buffer
```

Toggle between two files quickly with `<Ctrl-^>`.

### Buffer Arguments

```vim
:args *.java              " Set buffer list to all .java files
:argdo %s/old/new/ge      " Run command on all buffers
:argdo update             " Save all
```

### Hidden Buffers

By default, Neovim allows hidden buffers (unsaved changes in background):

```vim
:set hidden     " Allow switching buffers without saving
```

This is already enabled in Neovim4j config.

## Tabs

### Creating and Using Tabs

| Command | Action |
|---------|--------|
| `:tabnew` | Create new tab |
| `:tabnew <file>` | Open file in new tab |
| `gt` | Next tab |
| `gT` | Previous tab |
| `<number>gt` | Go to tab number |
| `:tabclose` | Close current tab |
| `:tabonly` | Close all but current tab |

### When to Use Tabs

Tabs are best for:
- Completely different workflows (e.g., code vs. tests vs. docs)
- Different projects
- Context switching

For the same project, prefer splits and buffers.

## Practice Exercises

### Exercise 1: Multi-File Editing

1. Open these files as buffers:
   - Main.java
   - User.java
   - UserService.java
   - UserController.java

2. Practice switching with:
   - `<Space>bb` - Buffer picker
   - `:b User` - Command switch
   - `]b` and `[b` - Next/previous

### Exercise 2: Split Workflow

1. Create this layout:
   ```
   ┌────────────┬──────────────┐
   │            │              │
   │ Main.java  │UserServ.java │
   │            │              │
   └────────────┴──────────────┘
   ```

2. Add a horizontal split on the right:
   ```
   ┌────────────┬──────────────┐
   │            │UserServ.java │
   │ Main.java  ├──────────────┤
   │            │  User.java   │
   └────────────┴──────────────┘
   ```

3. Navigate between all three with `<Ctrl-h/j/k/l>`

### Exercise 3: Code Review Workflow

Review changes across files:

1. Open old version in left split
2. Open new version in right split
3. Use `<Ctrl-h/l>` to compare
4. Make edits as needed

## Tips for Efficient Buffer Navigation

1. **Use fuzzy finder** - `<Space>ff` is faster than `:e` for known files
2. **Use `gd` liberally** - Jump to definitions, then `<Ctrl-o>` back
3. **Keep related files in splits** - Model and Service side-by-side
4. **Close unused buffers** - Keep buffer list clean with `:bd`
5. **Master `<Ctrl-^>`** - Quick toggle between two files
6. **Use marks** - Set marks with `m<letter>`, jump with `'<letter>`

## Common Patterns

### Pattern 1: Class and Test

```vim
:vs                           " Vertical split
<Space>ff                     " Find test file
```

Now you have class on left, test on right.

### Pattern 2: Interface and Implementation

```vim
:vs
" On interface name:
gi                            " Go to implementation
```

### Pattern 3: Multi-Class Refactoring

1. Open all related files as buffers
2. Use one split for editing
3. Switch buffers in that split with `<Space>bb`
4. Or create splits for most-used files

---
## What's Next?

In [Lesson 7: Code Navigation]({{< relref "/tutorial/07-code-navigation" >}}), you'll learn to navigate large codebases like a pro.
