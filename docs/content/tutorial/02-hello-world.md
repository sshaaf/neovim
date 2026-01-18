---
title: "Lesson 2: Hello World"
weight: 20
bookToc: true
---

# Lesson 2: Hello World

In this lesson, you'll write your first Java program in Neovim and learn the basics of editing with Vim motions.

## Learning Objectives

By the end of this lesson, you'll be able to:
- Write a simple Java program
- Understand Vim modes (Normal, Insert, Visual)
- Use basic editing commands
- Save and run your program

## Vim Modes Quick Reference

Neovim has different modes for different tasks:

| Mode | Purpose | How to Enter |
|------|---------|--------------|
| **Normal** | Navigate and execute commands | Press `Esc` |
| **Insert** | Type and edit text | Press `i`, `a`, `o`, etc. |
| **Visual** | Select text | Press `v`, `V`, `Ctrl-v` |
| **Command** | Run commands | Press `:` |

**Tip**: You'll spend most time in Normal mode, briefly entering Insert mode to type.

## Creating Hello World

Open your project:

```bash
cd ~/java-projects/maven-demo
nvim .
```

Create or open `Main.java`:
1. Press `<Space>ne` to open file explorer
2. Navigate to `src/main/java/com/example/`
3. Press `a` to create new file
4. Type: `Main.java`
5. Press Enter

## Writing the Code

Now you're in Insert mode (if not, press `i`). Type the following:

```java
package com.example;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello from Neovim!");
    }
}
```

### Basic Vim Editing

**Entering Insert Mode:**
- `i` - Insert before cursor
- `a` - Insert after cursor
- `o` - Open new line below
- `O` - Open new line above

**Leaving Insert Mode:**
- `Esc` - Return to Normal mode

**Moving Around (Normal Mode):**
- `h`, `j`, `k`, `l` - Left, Down, Up, Right
- `w` - Next word
- `b` - Previous word
- `0` - Start of line
- `$` - End of line
- `gg` - Top of file
- `G` - Bottom of file

**Deleting (Normal Mode):**
- `x` - Delete character
- `dd` - Delete line
- `dw` - Delete word
- `d$` - Delete to end of line

**Undo/Redo:**
- `u` - Undo
- `Ctrl-r` - Redo

## Saving Your File

In Normal mode (press `Esc` first):

```
:w
```

Or use the leader key shortcut:

```
<Space>w
```

## Running Your Program

### Option 1: Using Maven

Open a terminal (you can split Neovim or use a separate terminal):

```bash
mvn compile
mvn exec:java -Dexec.mainClass="com.example.Main"
```

### Option 2: Using Gradle

```bash
gradle build
gradle run
```

### Option 3: Direct Compilation (for simple projects)

```bash
# Compile
javac src/main/java/com/example/Main.java

# Run
java -cp src/main/java com.example.Main
```

### Option 4: Using Neovim Terminal

You can run commands without leaving Neovim:

1. Press `<C-7>` (Ctrl+7) to toggle the terminal
2. Run your Maven/Gradle commands
3. Press `<C-7>` again to toggle back, or `Ctrl-\` then `Ctrl-n` to exit terminal mode
4. Type `exit` to close the terminal

## Editing Practice

Let's practice editing your Hello World program:

### Exercise 1: Add More Output

1. Move to the line with `System.out.println`
2. Press `o` to open a new line below
3. Type: `System.out.println("Welcome to Java development with Neovim!");`
4. Press `Esc` to return to Normal mode
5. Save with `:w`

### Exercise 2: Change the Message

1. Move cursor to "Hello" in the string
2. Press `ciw` (change inner word)
3. Type: `Greetings`
4. Press `Esc`
5. Save with `:w`

### Exercise 3: Duplicate a Line

1. Move to any `System.out.println` line
2. Press `yy` to yank (copy) the line
3. Press `p` to paste below
4. Edit the new line as needed
5. Save with `:w`

## Common Vim Commands Summary

| Command | Action |
|---------|--------|
| `i` | Enter insert mode |
| `Esc` | Return to normal mode |
| `:w` | Save file |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |
| `u` | Undo |
| `Ctrl-r` | Redo |
| `dd` | Delete line |
| `yy` | Yank (copy) line |
| `p` | Paste |
| `/text` | Search for "text" |
| `n` | Next search result |
| `N` | Previous search result |

## Troubleshooting

### LSP Not Working?

Check if jdtls is running:
```
:LspInfo
```

You should see `jdtls` listed as attached.

### Syntax Highlighting Issues?

Make sure Treesitter is installed:
```
:checkhealth nvim-treesitter
```

### Build Errors?

Check your Java version:
```bash
java -version
javac -version
```

Make sure your `pom.xml` or `build.gradle` specifies the correct Java version.

## Tips for Vim Beginners

1. **Stay in Normal mode** - Don't keep Insert mode on all the time
2. **Use motions** - `w`, `b`, `e` are faster than arrow keys
3. **Practice `hjkl`** - It feels awkward at first but becomes natural
4. **Learn incrementally** - Master a few commands, then add more
5. **Run `:Tutor`** - Neovim's built-in tutorial is excellent

## Practice Exercise

Create a new class called `Calculator.java`:

```java
package com.example;

public class Calculator {
    public int add(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        Calculator calc = new Calculator();
        int result = calc.add(5, 3);
        System.out.println("5 + 3 = " + result);
    }
}
```

Use only Vim motions to:
1. Create the file
2. Write the code
3. Save it
4. Run it

---
## What's Next?

In [Lesson 3: Code Completion]({{< relref "/tutorial/03-code-completion" >}}), you'll learn to use intelligent auto-completion to code faster.


