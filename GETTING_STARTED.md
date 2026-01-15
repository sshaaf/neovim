# Getting Started with Neovim for Java Development

This guide will walk you through the essential workflows for Java development in Neovim.

## Prerequisites

Before starting, ensure you have:
- Neovim installed (v0.9+)
- JDK installed (Java 11 or later)
- This configuration installed at `~/.config/nvim`
- A Nerd Font installed and configured in your terminal

## First Time Setup

1. Open Neovim for the first time:
```bash
nvim
```

2. Lazy.nvim will automatically install all plugins. Wait for installation to complete.

3. Install the Java language server (jdtls):
```vim
:Mason
```
Navigate to `jdtls` and press `i` to install. Press `q` to quit Mason.

---

## 1. Creating Your First Java Project

### Step 1: Create Project Structure

```bash
mkdir -p ~/java-projects/HelloWorld/src/com/example
cd ~/java-projects/HelloWorld
```

### Step 2: Open Neovim
```bash
nvim .
```

---

## 2. Writing a HelloWorld Program

### Step 1: Open the File Explorer

Press `<Space>ne` (leader key + ne) to toggle nvim-tree file explorer.

Navigate using:
- `j` - Move down
- `k` - Move up
- `Enter` - Open file/folder
- `a` - Create new file
- `d` - Delete file
- `r` - Rename file
- `q` - Close file explorer

### Step 2: Create HelloWorld.java

1. In nvim-tree, navigate to `src/com/example/`
2. Press `a` to create a new file
3. Type: `HelloWorld.java` and press Enter
4. The file will open in the editor

### Step 3: Write the Code with Intellisense

Start typing:
```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

**Using Intellisense/Auto-completion:**

- As you type `Syst`, a completion menu will appear
- Use `<C-j>` (Ctrl+j) to move down in suggestions
- Use `<C-k>` (Ctrl+k) to move up in suggestions
- Press `<CR>` (Enter) to accept the suggestion
- Press `<C-e>` to dismiss the completion menu
- Press `<C-Space>` to manually trigger completion

**Completion Features:**
- Method signatures appear in the completion window
- LSP provides context-aware suggestions
- Imports are suggested automatically

---

## 3. Creating a New Class

### Method 1: Using File Explorer

1. Press `<Space>ne` to open nvim-tree
2. Navigate to the desired package folder (e.g., `src/com/example/`)
3. Press `a` to create a new file
4. Type the filename: `Person.java`
5. Press Enter

### Method 2: Using Fuzzy Finder

1. Press `<Space>fp` to open file finder
2. Start typing the path: `src/com/example/Person.java`
3. If the file doesn't exist, nvim will prompt you to create it
4. Confirm to create the new file

### Example: Creating Person.java

```java
package com.example;

public class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Use code actions to generate getters/setters
    // Place cursor on a field and press <leader>ca
}
```

**Generate Getters/Setters:**
1. Place cursor on `name` field
2. Press `<Space>ca` (code actions)
3. Select "Generate getters and setters"
4. Choose which fields to include

---

## 4. Moving Between Buffers

### Opening Multiple Files

**Method 1: File Explorer**
- Press `<Space>ne` and open multiple files by pressing Enter on each

**Method 2: Fuzzy Finder**
- Press `<Space>fp` (find files)
- Type filename and press Enter
- Repeat for more files

**Method 3: Recent Files**
- Press `<Space>fr` to see recently opened files

### Buffer Navigation

**Switch Between Buffers:**
- `<Tab>` - Next buffer
- `<S-Tab>` (Shift+Tab) - Previous buffer
- `<Space>1` through `<Space>9` - Jump to buffer number (if bufferline shows numbers)

**View All Buffers:**
- Press `<Space>fb` to fuzzy search open buffers
- Type to filter, press Enter to switch

**Close Buffers:**
- `:bd` - Close current buffer
- `:bd!` - Force close without saving
- In nvim-tree, press `d` on a file to close its buffer

**Buffer Management:**
```vim
:ls          " List all buffers
:b <number>  " Switch to buffer by number
:bn          " Next buffer
:bp          " Previous buffer
```

---

## 5. Creating a New Package

### Step 1: Create Package Directory

**In nvim-tree:**
1. Press `<Space>ne` to open file explorer
2. Navigate to `src/` or `src/com/example/`
3. Press `a` to create
4. Type: `utils/` (with trailing slash for directory)
5. Press Enter

**From Command Line:**
```bash
mkdir -p src/com/example/utils
```

### Step 2: Create Class in New Package

1. Navigate to the new package in nvim-tree
2. Press `a` to create file: `StringUtils.java`
3. Write the class with correct package declaration:

```java
package com.example.utils;

public class StringUtils {
    public static boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
```

**LSP will help:**
- Auto-suggest package name when you type `package`
- Warn if package declaration doesn't match directory structure
- Auto-import when you use classes from other packages

---

## 6. Debugging a Java File

### Step 1: Set Breakpoints

1. Open your Java file (e.g., `HelloWorld.java`)
2. Navigate to the line where you want to break (e.g., line 3)
3. Press `<Space>db` to toggle breakpoint
   - A sign/icon will appear in the gutter
4. Add more breakpoints as needed

### Step 2: Start Debugging

**Method 1: Debug Current Class**
```vim
:JavaDebugger
```
Or create a keybinding to run the main method in debug mode.

**Method 2: Run Tests in Debug Mode**
- For JUnit tests, press `<Space>jt` to run tests with debugger attached

### Step 3: Debug Controls

Once debugging starts:

- `<Space>dc` - **Continue** (run until next breakpoint)
- `<Space>dn` - **Step Over** (execute current line, don't step into methods)
- `<Space>di` - **Step Into** (step into method calls)
- `<Space>do` - **Step Out** (finish current method and return)
- `<Space>db` - **Toggle Breakpoint** on current line

### Step 4: Inspect Variables

While debugging:
- Hover over variables to see values (if hover is configured)
- Use `:lua require('dap.ui.widgets').hover()` to see variable values
- DAP UI will show variables, call stack, and breakpoints

### Example Debug Session

```java
public class Calculator {
    public static void main(String[] args) {
        int a = 10;          // Set breakpoint here
        int b = 20;          // Set breakpoint here
        int sum = add(a, b); // Step into this method
        System.out.println("Sum: " + sum);
    }

    public static int add(int x, int y) {
        return x + y;        // Inspect x and y values
    }
}
```

---

## 7. Looking Up Classes, References, and Variables

### Go to Definition

**Go to where a class/method/variable is defined:**

1. Place cursor on a class name, method name, or variable
2. Press `gd` - **Go to Definition**
   - Opens the file where it's defined
   - For built-in Java classes, may open the decompiled source

**Alternative:**
- `<Space>gd` - Opens definition in Telescope picker (shows preview)

### Find References

**Find all places where a class/method/variable is used:**

1. Place cursor on the symbol
2. Press `gR` or `gr` - **Show References**
   - Telescope will open showing all references
   - Navigate with `j`/`k`, press Enter to jump

**Example:**
```java
public class Person {
    private String name;  // Place cursor here and press gR

    public Person(String name) {
        this.name = name;  // This will be shown as a reference
    }

    public String getName() {
        return name;       // This will also be shown
    }
}
```

### Go to Implementation

**Find implementations of an interface or abstract method:**

1. Place cursor on interface/abstract method name
2. Press `gi` - **Go to Implementation**
   - Shows all classes implementing the interface
   - Shows all methods implementing the abstract method

### Type Hierarchy

**View class hierarchy (superclasses and subclasses):**

1. Place cursor on class name
2. Press `<Space>th` - **Type Hierarchy**
   - Shows inheritance tree
   - Navigate parent/child relationships

### Call Hierarchy

**See where a method is called (call chain):**

1. Place cursor on method name
2. Press `<Space>ch` - **Call Hierarchy**
   - Shows all callers of this method
   - Shows methods called by this method

### Symbol Search

**Search for classes, methods, variables across project:**

Press `<Space>fs` (find symbols) or:
```vim
:Telescope lsp_workspace_symbols
```

Start typing to search:
- Class names
- Method names
- Field names
- Across all files in workspace

### Hover Documentation

**View documentation for symbol under cursor:**

1. Place cursor on class/method/variable
2. Press `K` (capital K) - **Show Hover Documentation**
   - Shows Javadoc
   - Shows method signatures
   - Shows type information
   - Press `K` again to enter the documentation window
   - Press `q` to close

### Symbol Outline in Current File

**See all methods/fields in current file:**

```vim
:Telescope lsp_document_symbols
```

- Lists all symbols in current file
- Jump to any method/field quickly

---

## 8. Code Navigation Quick Reference

| Action | Keybinding | Description |
|--------|------------|-------------|
| Go to Definition | `gd` | Jump to where symbol is defined |
| Go to Declaration | `gD` | Jump to declaration |
| Go to Implementation | `gi` | Jump to implementation |
| Go to Type Definition | `gt` | Jump to type definition |
| Find References | `gR` or `gr` | Show all references |
| Show Hover Doc | `K` | Show documentation |
| Code Actions | `<Space>ca` | Show available code actions |
| Rename Symbol | `<Space>rn` | Rename across all files |
| Type Hierarchy | `<Space>th` | Show class hierarchy |
| Call Hierarchy | `<Space>ch` | Show call relationships |
| Diagnostics (File) | `<Space>D` | Show all errors/warnings in file |
| Diagnostics (Line) | `<Space>d` | Show error/warning on current line |
| Next Diagnostic | `]d` | Jump to next error/warning |
| Previous Diagnostic | `[d` | Jump to previous error/warning |

---

## 9. Testing with JUnit

### Running Tests

**Run all tests in current class:**
- Press `<Space>jt` - Run class tests

**Run tests in current file:**
- Press `<Space>jT` - Run file tests

**Run single test method:**
- Place cursor inside test method
- Press `<Space>jm` - Run method test

### Example Test Class

```java
package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class PersonTest {

    @Test
    public void testPersonCreation() {
        Person p = new Person("John", 30);
        assertEquals("John", p.getName());
        assertEquals(30, p.getAge());
    }

    @Test
    public void testPersonAge() {
        // Place cursor here and press <Space>jm to run just this test
        Person p = new Person("Jane", 25);
        assertTrue(p.getAge() > 0);
    }
}
```

---

## 10. Terminal Integration

### Open Terminal

- Press `<Ctrl-\>` or `<Space><C-7>` to open terminal
- Type commands as normal
- Press `<C-\><C-n>` to exit terminal mode (return to normal mode)
- Press `i` to enter terminal mode again

### Use Cases

**Compile and run:**
```bash
# In terminal
javac src/com/example/HelloWorld.java
java -cp src com.example.HelloWorld
```

**Run Maven/Gradle:**
```bash
mvn clean install
gradle build
```

---

## 11. Working with Maven/Gradle Projects

### Maven Project

```bash
# Create new Maven project
mvn archetype:generate -DgroupId=com.example -DartifactId=myapp

# Open in nvim
cd myapp
nvim .
```

Java files in `src/main/java/com/example/` will have full LSP support.

### Gradle Project

```bash
# Create new Gradle project
gradle init --type java-application

# Open in nvim
nvim .
```

---

## 12. Common Workflows

### Workflow 1: Creating a New Feature

1. `<Space>ne` - Open file explorer
2. Navigate and press `a` to create new file: `Feature.java`
3. Write code with auto-completion (`<C-Space>`)
4. Press `<Space>ca` on class name to generate constructors
5. Press `<Space>ca` on fields to generate getters/setters
6. Use `gd` to navigate to referenced classes
7. Use `<Space>rn` to rename variables/methods

### Workflow 2: Fixing Errors

1. `<Space>D` - View all diagnostics in file
2. `]d` - Jump to next error
3. `<Space>d` - See error details
4. `<Space>ca` - See code actions/quick fixes
5. Select and apply fix

### Workflow 3: Refactoring

1. Place cursor on method/variable to rename
2. `<Space>rn` - Rename symbol
3. Type new name and press Enter
4. All references updated automatically

### Workflow 4: Understanding Unfamiliar Code

1. `<Space>fp` - Find the main class
2. `gd` - Jump to class definitions
3. `K` - Read documentation
4. `gR` - See where methods are used
5. `<Space>ch` - Understand call hierarchy
6. `<Space>th` - See class hierarchy

---

## 13. Vim Basics Reminder

### Modes

- **Normal Mode** (default): Press `Esc`
- **Insert Mode** (typing): Press `i`, `a`, `o`, etc.
- **Visual Mode** (selection): Press `v`, `V`, or `<C-v>`
- **Command Mode**: Press `:`

### Basic Navigation (Normal Mode)

- `h` - Left
- `j` - Down
- `k` - Up
- `l` - Right
- `w` - Next word
- `b` - Previous word
- `gg` - Go to top of file
- `G` - Go to bottom of file
- `0` - Start of line
- `$` - End of line

### Basic Editing (Normal Mode)

- `i` - Insert before cursor
- `a` - Insert after cursor
- `o` - New line below
- `O` - New line above
- `dd` - Delete line
- `yy` - Copy line
- `p` - Paste
- `u` - Undo
- `<C-r>` - Redo

### Save and Quit

- `:w` - Save
- `:q` - Quit
- `:wq` - Save and quit
- `:q!` - Quit without saving

---

## 14. Tips and Tricks

### Tip 1: Use Telescope for Everything

Telescope is your friend:
- `<Space>fp` - Find any file
- `<Space>fr` - Recent files
- `<Space>fs` - Live grep (search in files)
- `<Space>fb` - Switch buffers

### Tip 2: Learn Code Actions

`<Space>ca` is powerful:
- Generate constructors
- Generate getters/setters
- Add imports
- Implement interfaces
- Override methods
- Organize imports

### Tip 3: Use AI Assistant

If Copilot/ChatGPT is configured:
- `<Tab>` - Accept Copilot suggestion
- `<Space>ac` - Open ChatGPT chat
- `<Space>ae` - Edit code with AI (visual mode)
- `<Space>ax` - Explain code (visual mode)

### Tip 4: Split Windows

Work with multiple files:
- `:vs` - Vertical split
- `:sp` - Horizontal split
- `<C-w>h/j/k/l` - Navigate splits
- `<C-w>=` - Equal split sizes

---

## 15. Troubleshooting

### LSP Not Working

1. Check Java is installed: `java -version`
2. Check jdtls is installed: `:Mason`
3. Restart LSP: `<Space>rs`
4. Check LSP status: `:LspInfo`

### No Auto-completion

1. Ensure you're in Insert mode
2. Press `<C-Space>` to manually trigger
3. Check nvim-cmp is loaded: `:Lazy`

### Slow Performance

1. Close unused buffers: `:bd`
2. Restart nvim
3. Check if large files are open

---

## Next Steps

1. Practice the workflows above
2. Customize keybindings in `lua/neovim4j/core/keymaps.lua`
3. Explore `:help nvim-java` for more Java-specific features
4. Check out `:Lazy` to explore installed plugins
5. Read the main README.md for AI integration setup

Happy coding!
