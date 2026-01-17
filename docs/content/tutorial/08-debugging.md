---
title: "Lesson 8: Debugging"
weight: 80
bookToc: true
---

# Lesson 8: Debugging

In this lesson, you'll learn to debug Java applications using Neovim's DAP (Debug Adapter Protocol) integration.

## Learning Objectives

By the end of this lesson, you'll be able to:
- Set and remove breakpoints
- Start debug sessions
- Step through code
- Inspect variables
- Evaluate expressions
- Use the debug REPL

## What is DAP?

DAP (Debug Adapter Protocol) is like LSP but for debugging. Neovim4j uses:
- `nvim-dap` - Debug adapter client
- `nvim-dap-ui` - Beautiful debug UI
- `java-debug` - Java debug adapter (via nvim-java)

## Debug UI Overview

When you start debugging, the UI shows:

```
┌─────────────────┬──────────────┐
│                 │  Variables   │
│   Your Code     │  Watches     │
│  (with BP)      │              │
│                 ├──────────────┤
│                 │  Stack Trace │
└─────────────────┴──────────────┘
```

## Setting Breakpoints

### Toggle Breakpoint

Place cursor on a line and press:

```
<Space>db
```

(Debug Breakpoint)

A sign appears in the gutter (usually a red dot).

### Conditional Breakpoint

```
<Space>dC
```

(Debug Conditional Breakpoint)

Enter a condition:
```
user.getAge() > 18
```

Breakpoint only hits when condition is true.

### List All Breakpoints

```vim
:lua require('dap').list_breakpoints()
```

### Clear All Breakpoints

```vim
:lua require('dap').clear_breakpoints()
```

## Starting a Debug Session

### Debug Current File

If your file has a `main` method:

```
<Space>dc
```

(Debug Continue - starts debugging)

### Debug Test

On a test file or method:

```
<Space>jt
```

Runs tests in debug mode (if configured).

### Debug with Arguments

Create a launch configuration or use:

```vim
:lua require('dap').continue()
```

## Debug Controls

Once debugging has started:

| Key | Action | Description |
|-----|--------|-------------|
| `<Space>dc` | Continue | Resume execution |
| `<Space>ds` | Step Over | Execute current line |
| `<Space>di` | Step Into | Step into method |
| `<Space>do` | Step Out | Step out of method |
| `<Space>dt` | Terminate | Stop debugging |
| `<Space>dr` | REPL | Open debug console |

## Stepping Through Code

### Step Over (F10)

```
<Space>ds
```

Executes the current line and moves to the next line. Doesn't enter method calls.

**Example:**
```java
int x = 5;               // ← Stopped here
int y = calculateSum(x);  // Press <Space>ds
int z = y * 2;           // ← Stops here (doesn't enter calculateSum)
```

### Step Into (F11)

```
<Space>di
```

Steps into method calls.

**Example:**
```java
int x = 5;
int y = calculateSum(x);  // ← Stopped here, press <Space>di
// ↓ Jumps into calculateSum method:
public int calculateSum(int val) {
    return val + 10;  // ← Now here
}
```

### Step Out (Shift+F11)

```
<Space>do
```

Finishes current method and returns to caller.

**Example:**
```java
public int calculateSum(int val) {
    int result = val + 10;  // ← Stopped here
    return result;           // Press <Space>do
}
// ↓ Returns to caller:
int y = calculateSum(x);  // ← Now here
```

### Continue

```
<Space>dc
```

Runs until next breakpoint or program end.

## Inspecting Variables

### Variables Window

Automatically shows:
- Local variables
- Method parameters
- Object fields
- Current values

Navigate with `j`/`k`, press `Enter` to expand objects.

### Hover to Inspect

In debug mode, hover cursor over variable and press:

```
K
```

Shows current value in popup.

### Watches

Add expressions to watch:

```vim
:lua require('dap.ui.widgets').hover()
```

Or use the Watches pane to add custom expressions.

## Debug REPL

### Open REPL

```
<Space>dr
```

(Debug REPL)

Opens an interactive console where you can:
- Evaluate expressions
- Call methods
- Modify variables

### REPL Commands

```java
// Print variable
> user.getName()
"Alice"

// Evaluate expression
> user.getAge() > 18
true

// Call methods
> list.add("new item")

// Check object state
> this.field
42
```

Press `<Ctrl-c>` or type `.exit` to close REPL.

## Example Debug Session

Let's debug this code:

```java
package com.example;

public class Calculator {
    public static int divide(int a, int b) {
        return a / b;  // Bug: no zero check!
    }

    public static void main(String[] args) {
        int result1 = divide(10, 2);
        System.out.println("10 / 2 = " + result1);

        int result2 = divide(10, 0);  // Will throw exception
        System.out.println("10 / 0 = " + result2);
    }
}
```

### Debug Steps:

1. **Set breakpoint** on `int result1 = divide(10, 2);`
   - Cursor on that line
   - Press `<Space>db`

2. **Start debugging**
   - Press `<Space>dc`
   - Program stops at breakpoint

3. **Inspect variables**
   - Look at Variables pane
   - See `args` array

4. **Step over**
   - Press `<Space>ds`
   - `result1` now equals 5
   - Check Variables pane

5. **Step into**
   - Cursor on `divide(10, 0)` line
   - Press `<Space>di`
   - Jump into `divide` method

6. **Inspect parameters**
   - Variables show: `a = 10`, `b = 0`
   - Aha! Division by zero!

7. **Step out**
   - Press `<Space>do`
   - Exception is thrown

8. **Fix the bug**
   - Stop debugging: `<Space>dt`
   - Add zero check:
   ```java
   public static int divide(int a, int b) {
       if (b == 0) {
           throw new IllegalArgumentException("Cannot divide by zero");
       }
       return a / b;
   }
   ```

9. **Debug again**
   - Set breakpoint
   - Press `<Space>dc`
   - Verify fix works

## Advanced Debugging

### Conditional Breakpoints

Useful for loops:

```java
for (int i = 0; i < 100; i++) {
    processItem(i);  // Only want to break when i == 50
}
```

1. Set conditional breakpoint: `<Space>dC`
2. Enter condition: `i == 50`
3. Runs 50 iterations, then stops

### Exception Breakpoints

Break when exception is thrown:

```vim
:lua require('dap').set_exception_breakpoints({"all"})
```

Now debugger stops on any exception.

### Logpoints

Print message without stopping:

```vim
:lua require('dap').set_breakpoint(nil, nil, 'User: {user.name}')
```

Prints log message when line is hit.

## Debugging Tests

### Debug Single Test

1. Open test file
2. Put cursor inside test method
3. Press `<Space>jt` to run test in debug mode

### Debug Test Class

Run all tests in file with debugging:

```vim
:lua require('jdtls').test_class()
```

### Debug Failed Test

1. Run tests normally
2. See which failed
3. Set breakpoint in failing test
4. Run debug mode

## Debug UI Navigation

### Scopes Window

Shows variable scopes:
- Local
- Global
- Closure (if applicable)

Navigate: `j`/`k`, expand: `Enter`, collapse: `Backspace`

### Stack Trace Window

Shows call stack:
```
main(String[] args)
  └─ processUsers()
    └─ validateUser(User user)  ← Current frame
```

Click on frame to jump to that context.

### Breakpoints Window

Lists all breakpoints:
- Enable/disable: `Enter`
- Delete: `d`
- Edit condition: `e`

## Common Debugging Scenarios

### Scenario 1: NullPointerException

```java
User user = getUser();
String name = user.getName();  // NPE here
```

Debug steps:
1. Set breakpoint before `getName()` call
2. Inspect `user` variable
3. If null, trace back to `getUser()`

### Scenario 2: Incorrect Logic

```java
if (age > 18 && age < 65) {  // Bug: what about age == 65?
    System.out.println("Working age");
}
```

Debug steps:
1. Set breakpoint inside if block
2. Test with age = 65
3. Notice it doesn't enter block
4. Fix: `age >= 18 && age < 65`

### Scenario 3: Loop Issues

```java
for (int i = 0; i < list.size(); i++) {
    if (list.get(i).equals(target)) {
        list.remove(i);  // Bug: skips elements!
    }
}
```

Debug steps:
1. Set conditional breakpoint: `i == 3`
2. Step through iterations
3. Watch `list.size()` change
4. Notice index mismatch
5. Fix: iterate backwards or use iterator

## Debugging Best Practices

1. **Start with print statements** - Sometimes faster than debugger
2. **Use conditional breakpoints** - Don't click through 100 iterations
3. **Inspect object state** - Expand objects in Variables pane
4. **Use REPL for experiments** - Test fixes before editing code
5. **Watch the stack trace** - Understand call hierarchy
6. **Step wisely** - Step over (F10) most of the time, step into (F11) when needed

## Troubleshooting Debug Issues

### Debugger Won't Start

1. **Check Java Debug Extension:**
   ```vim
   :checkhealth
   ```

2. **Verify jdtls is running:**
   ```vim
   :LspInfo
   ```

3. **Check for syntax errors:**
   - Fix any compilation errors first

### Breakpoints Not Hitting

1. **Ensure code is compiled:**
   ```bash
   mvn compile
   ```

2. **Check breakpoint is on executable line:**
   - Not on blank line or comment

3. **Verify debug session started:**
   - Look for debug UI windows

### Variables Not Showing

1. **Expand object in Variables pane:**
   - Press `Enter` on object

2. **Check variable scope:**
   - Variable might be out of scope

3. **Step to next line:**
   - Variables update after line executes

## Keybindings Summary

| Key | Action |
|-----|--------|
| `<Space>db` | Toggle breakpoint |
| `<Space>dC` | Conditional breakpoint |
| `<Space>dc` | Start/Continue debugging |
| `<Space>ds` | Step over |
| `<Space>di` | Step into |
| `<Space>do` | Step out |
| `<Space>dt` | Terminate debug session |
| `<Space>dr` | Open REPL |

## What's Next?

In [Lesson 9: Testing](09-testing.md), you'll learn to run and manage JUnit tests in Neovim.

---

[← Previous: Code Navigation](07-code-navigation.md) | [Next: Testing →](09-testing.md)
