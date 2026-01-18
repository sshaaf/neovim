---
title: "Lesson 3: Code Completion"
weight: 30
bookToc: true
---

# Lesson 3: Code Completion

In this lesson, you'll learn to use IntelliSense-style auto-completion powered by the Java Language Server (jdtls).

## Learning Objectives

By the end of this lesson, you'll be able to:
- Use auto-completion while typing
- Navigate completion suggestions
- Accept and dismiss completions
- Understand completion sources (LSP, snippets, buffer)

## How Auto-Completion Works

Neovim4j uses `nvim-cmp` for completion, which combines multiple sources:

- **LSP (jdtls)** - Intelligent Java completions
- **Snippets** - Common code patterns
- **Buffer** - Words from open files
- **Path** - File paths

## Basic Completion Usage

### Auto-Trigger

Start typing, and completions appear automatically:

```java
public class Main {
    public static void main(String[] args) {
        System.out.
        // ↑ Completions appear when you type the dot
    }
}
```

### Manual Trigger

If completions don't appear automatically:

| Key | Action |
|-----|--------|
| `<Ctrl-Space>` | Manually trigger completion |
| `<Ctrl-j>` | Next suggestion |
| `<Ctrl-k>` | Previous suggestion |
| `<Enter>` | Accept suggestion |
| `<Ctrl-e>` | Dismiss completion menu |

### Navigating Suggestions

When the completion menu is open:

- `<Ctrl-j>` or `<Down>` - Move to next item
- `<Ctrl-k>` or `<Up>` - Move to previous item
- `<Ctrl-d>` - Scroll documentation down
- `<Ctrl-u>` - Scroll documentation up
- `<Enter>` - Accept selected item
- `<Ctrl-e>` - Close menu

## Practice: Using Completions

### Example 1: Method Completion

Create a new file or open `Main.java`:

```java
package com.example;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        names.  // ← Type dot and wait
    }
}
```

When you type `names.`, you'll see:
- `add()`
- `remove()`
- `size()`
- `clear()`
- etc.

**Try it:**
1. Type `names.ad`
2. See completion narrow to `add` methods
3. Press `Enter` to accept `add(E e)`
4. Fill in the parameter: `add("Alice")`

### Example 2: Creating Objects

```java
List<String> list = new Arr  // ← Start typing ArrayList
```

**What happens:**
1. Type `new Arr`
2. Completions show `ArrayList`, `Arrays`, etc.
3. Select `ArrayList`
4. Press `Enter`
5. Auto-completes to `new ArrayList<>()`

### Example 3: Import Statements

```java
public class Main {
    public static void main(String[] args) {
        ArrayL  // ← Type ArrayList (without import)
    }
}
```

**What happens:**
1. Completion suggests `ArrayList`
2. Accept it
3. jdtls automatically adds: `import java.util.ArrayList;`

## Completion Symbols

Completion items have icons indicating their type:

| Icon | Type |
|------|------|
| 󰊕 | Method |
| 󰆧 | Function |
| 󰙅 | Variable |
| 󰫧 | Field |
| 󰌗 | Class |
| 󰜰 | Interface |
| 󰏿 | Keyword |
| 󰆕 | Snippet |
| 󰈙 | Module |

## Advanced Completion Features

### Snippet Completion

Type common patterns and expand them:

**Example: `main` snippet**
1. Type `main`
2. Select the snippet from completions
3. Press `Enter`
4. Expands to full main method

**Example: `sout` snippet**
1. Type `sout`
2. Press `Enter`
3. Expands to `System.out.println()`

**Example: `for` loop**
1. Type `for`
2. Select snippet
3. Tab through placeholders

### Method Parameter Hints

When calling methods, you'll see parameter hints:

```java
list.add(  // Shows: add(E e) - parameter hint appears
```

### Completion Documentation

Selected completion shows documentation in a popup window. Read it to understand:
- Method signatures
- Parameter types
- Return types
- Brief descriptions

## Practice Exercises

### Exercise 1: String Methods

Create this code and use completions:

```java
String message = "Hello World";
message.   // Explore available methods
```

Try finding:
1. `length()` - get string length
2. `toUpperCase()` - convert to uppercase
3. `substring(int beginIndex)` - extract substring
4. `contains(CharSequence s)` - check if contains text

### Exercise 2: List Operations

```java
import java.util.ArrayList;
import java.util.List;

public class ListDemo {
    public static void main(String[] args) {
        List<Integer> numbers = new ArrayList<>();
        numbers.  // Complete all these operations:
        // add(10)
        // add(20)
        // get(0)
        // size()
        // remove(0)
    }
}
```

Use auto-completion for each method call.

### Exercise 3: Creating Classes

Start typing and let completion help:

```java
public class Person {
    private String name;
    private int age;

    // Use completion to generate:
    // - Constructor
    // - Getters
    // - Setters
}
```

**Hint**: Type `get` and see completion suggestions for getters.

## Customization Tips

### If Completion is Too Aggressive

Completions trigger automatically after 100ms. If you find this distracting:

1. Open: `lua/plugins/completion.lua`
2. Adjust `completion.autocomplete` delay
3. Or disable auto-trigger entirely

### Accepting with Tab

By default:
- `Enter` accepts completion
- `Tab` can also be configured (check your config)

### Signature Help

When inside function parameters, press:
```
<Ctrl-k>
```

To manually trigger signature help.

## Common Issues

### Completions Not Appearing?

1. **Check LSP is running:**
   ```vim
   :LspInfo
   ```
   Should show `jdtls` attached

2. **Check completion plugin:**
   ```vim
   :checkhealth nvim-cmp
   ```

3. **Restart LSP:**
   ```vim
   :LspRestart
   ```

### Wrong Completions?

If completions seem incorrect:
1. Make sure file is saved (`:w`)
2. Wait for jdtls to finish indexing (first time can be slow)
3. Check for syntax errors in your code

### No Import Auto-Add?

Make sure you're accepting completions from the LSP source (they'll have specific icons).

## Tips for Effective Completion Usage

1. **Let it flow** - Don't fight completions, let them guide you
2. **Learn patterns** - Notice which completions appear for different contexts
3. **Read docs** - The completion popup shows useful documentation
4. **Use snippets** - They save time for boilerplate code
5. **Explore APIs** - Type `.` and browse what's available

---
## What's Next?

In [Lesson 4: Creating Classes]({{< relref "/tutorial/04-creating-classes" >}}), you'll learn multiple ways to create and manage Java classes.


