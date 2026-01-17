---
title: "Lesson 4: Creating Classes"
weight: 40
bookToc: true
---

# Lesson 4: Creating Classes

In this lesson, you'll learn different ways to create Java classes and use code actions to generate boilerplate code.

## Learning Objectives

By the end of this lesson, you'll be able to:
- Create classes using the file explorer
- Use fuzzy finder to create files quickly
- Generate constructors, getters, and setters
- Use code actions effectively

## Method 1: File Explorer

The traditional way using nvim-tree:

1. Open file explorer: `<Space>ne`
2. Navigate to `src/main/java/com/example/`
3. Press `a` (add file)
4. Type filename: `Person.java`
5. Press `Enter`

The file opens, ready for editing.

## Method 2: Fuzzy Finder

Faster way using Telescope:

1. Press `<Space>ff` (find files)
2. Start typing the path: `src/main/java/com/example/Person.java`
3. If file doesn't exist, press `<Ctrl-n>` to create it
4. Confirm creation

**Note**: This creates the file immediately when you select a non-existent path.

## Method 3: Command Line

From Neovim command mode:

```vim
:e src/main/java/com/example/Person.java
```

Press `Enter` and start editing. Save with `:w` to create the file.

## Creating a Basic Class

Let's create a `Person` class:

```java
package com.example;

public class Person {
    private String name;
    private int age;
    private String email;
}
```

Type this out (practicing Vim motions!). Save with `<Space>w`.

## Using Code Actions

Code actions are context-aware commands that jdtls provides. They're extremely powerful for Java development.

### Accessing Code Actions

Place your cursor on a class, method, or variable and press:

```
<Space>ca
```

(Leader key + 'ca' for Code Actions)

### Generating Constructors

1. Create your class with fields (like Person above)
2. Move cursor to the class name line (`public class Person`)
3. Press `<Space>ca`
4. Select "Generate constructor"
5. Choose which fields to include
6. Constructor is generated automatically

Example result:

```java
public class Person {
    private String name;
    private int age;
    private String email;

    public Person(String name, int age, String email) {
        this.name = name;
        this.age = age;
        this.email = email;
    }
}
```

### Generating Getters and Setters

1. Move cursor to a field (e.g., `private String name`)
2. Press `<Space>ca`
3. Select "Generate getters and setters"
4. Choose which fields

Or use code actions on the class itself to generate for all fields at once.

Example result:

```java
public class Person {
    private String name;
    private int age;
    private String email;

    public Person(String name, int age, String email) {
        this.name = name;
        this.age = age;
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
```

### Other Useful Code Actions

| Action | Description |
|--------|-------------|
| Generate toString() | Create string representation |
| Generate equals() and hashCode() | For object comparison |
| Implement methods | When implementing interface |
| Override methods | When extending class |
| Add imports | Import missing classes |
| Organize imports | Clean up import statements |

## Organizing Imports

If you have unused or missing imports:

1. Press `<Space>ca` anywhere in the file
2. Select "Organize imports"
3. Imports are cleaned up automatically

Or use the direct command:

```vim
:lua vim.lsp.buf.code_action({context = {only = {"source.organizeImports"}}})
```

## Practice Exercise: Create a Book Class

Create a complete `Book` class with code actions:

### Step 1: Create the file

```java
package com.example;

public class Book {
    private String title;
    private String author;
    private int year;
    private double price;
}
```

### Step 2: Generate constructor

1. Cursor on `class Book`
2. `<Space>ca`
3. Select "Generate constructor"
4. Include all fields

### Step 3: Generate getters and setters

1. `<Space>ca`
2. Generate for all fields

### Step 4: Add toString() method

1. `<Space>ca`
2. Select "Generate toString()"

### Step 5: Test your class

Create a main method:

```java
public static void main(String[] args) {
    Book book = new Book("1984", "George Orwell", 1949, 15.99);
    System.out.println(book.toString());
}
```

## Advanced: Interface Implementation

Create an interface:

```java
package com.example;

public interface Printable {
    void print();
    String getDescription();
}
```

Implement it in Person:

```java
public class Person implements Printable {
    // ... existing code ...
}
```

You'll see an error (red squiggly line). Fix it:

1. Cursor on `implements Printable`
2. Press `<Space>ca`
3. Select "Implement methods"
4. Methods are generated with stubs

## Common Code Actions

### Quick Fix

When you see errors (red underlines):

1. Move cursor to the error
2. Press `<Space>ca`
3. See suggested fixes

Examples:
- Add missing import
- Create missing method
- Change access modifier
- Assign to new variable

### Extract to Method

Select code in Visual mode, then:

1. Press `v` to enter Visual mode
2. Select lines to extract
3. Press `<Space>ca`
4. Select "Extract to method"
5. Name the new method

### Rename Symbol

Better than find-and-replace:

1. Cursor on class/method/variable name
2. Press `<Space>rn` (rename)
3. Type new name
4. Press `Enter`
5. All references updated across project

## Keybindings Summary

| Key | Action |
|-----|--------|
| `<Space>ca` | Code actions |
| `<Space>rn` | Rename symbol |
| `gd` | Go to definition |
| `K` | Show documentation |
| `<Space>ff` | Find/create file |
| `<Space>ne` | File explorer |

## Tips

1. **Explore code actions** - Press `<Space>ca` on different elements to see what's available
2. **Use rename liberally** - It's safe and updates all references
3. **Let LSP generate boilerplate** - Don't type getters/setters manually
4. **Keep imports clean** - Regularly organize imports
5. **Read error messages** - Code actions often suggest the fix

## What's Next?

In [Lesson 5: Managing Packages](05-managing-packages.md), you'll learn to organize code with Java packages.

---

[← Previous: Code Completion](03-code-completion.md) | [Next: Managing Packages →](05-managing-packages.md)
