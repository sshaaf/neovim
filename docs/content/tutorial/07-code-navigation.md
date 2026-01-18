---
title: "Lesson 7: Code Navigation"
weight: 70
bookToc: true
---

# Lesson 7: Code Navigation

In this lesson, you'll learn to navigate large Java codebases efficiently using LSP-powered features.

## Learning Objectives

By the end of this lesson, you'll be able to:
- Jump to definitions and declarations
- Find all references to a symbol
- Navigate type hierarchies
- Search for symbols across the project
- Use the jump list effectively

## Core Navigation Commands

### Go to Definition

Place cursor on a class, method, or variable and press:

```
gd
```

**Example:**
```java
public class Main {
    public static void main(String[] args) {
        UserService service = new UserService();
        //          ^^^^^^^ cursor here, press gd
    }
}
```

Jumps to the `UserService` class definition.

### Go to Declaration

```
gD
```

Similar to `gd`, but goes to the declaration rather than the definition. In Java, these are usually the same.

### Go to Implementation

```
gi
```

Useful for interfaces and abstract classes:

```java
List<String> list = new ArrayList<>();
//   ^^^^ cursor on List, press gi
```

Shows all implementations of `List` interface.

### Go to Type Definition

```
gy
```

Jumps to the type of a variable:

```java
var user = getUserById(1);
//  ^^^^ cursor here, press gy
```

Jumps to the `User` class definition.

## Finding References

### Find All References

Place cursor on any symbol and press:

```
gr
```

**Example:**
```java
public class User {
    private String name;
    //             ^^^^ cursor here, press gr
}
```

Shows all places where `name` is used:
- Constructor assignments
- Getter/setter methods
- Usage in other classes

Opens in Telescope picker showing all references.

### Find References in Quickfix

Alternative way:

```vim
:lua vim.lsp.buf.references()
```

Opens references in quickfix window:
- `<Enter>` - Jump to reference
- `:cn` - Next reference
- `:cp` - Previous reference
- `:cclose` - Close quickfix

## Symbol Search

### Document Symbols

Search symbols in current file:

```
<Space>ds
```

(Document Symbols)

Shows:
- All classes
- All methods
- All fields
- All variables

Type to filter, press `Enter` to jump.

### Workspace Symbols

Search symbols across entire project:

```
<Space>ws
```

(Workspace Symbols)

**Example searches:**
- `UserS` - Finds UserService, UserServiceImpl, etc.
- `getUser` - Finds all methods named getUser
- `MAX_RETRIES` - Finds constant definitions

## Type Hierarchy

### View Type Hierarchy

On a class or interface:

```vim
:lua vim.lsp.buf.type_hierarchy()
```

Or use code action:
```
<Space>ca
```
Select "Show type hierarchy"

Shows:
- Superclasses
- Interfaces
- Subclasses
- Implementations

## Call Hierarchy

### Incoming Calls

See what methods call this method:

```vim
:lua vim.lsp.buf.incoming_calls()
```

### Outgoing Calls

See what methods this method calls:

```vim
:lua vim.lsp.buf.outgoing_calls()
```

## Documentation Lookup

### Hover Documentation

Place cursor on symbol and press:

```
K
```

(Shift-K)

Shows:
- Method signatures
- Parameter types
- Return types
- JavaDoc comments
- Type information

Press `K` again to jump into the hover window.

### Signature Help

While editing method parameters:

```
<Ctrl-k>
```

Shows:
- Expected parameter types
- Parameter names
- Overload options

## The Jump List

Neovim remembers where you've been.

### Jump Back/Forward

| Key | Action |
|-----|--------|
| `<Ctrl-o>` | Jump to previous location (older) |
| `<Ctrl-i>` | Jump to next location (newer) |

**Example workflow:**
1. In Main.java, press `gd` on UserService → jumps to UserService.java
2. Press `gd` on User → jumps to User.java
3. Press `<Ctrl-o>` → back to UserService.java
4. Press `<Ctrl-o>` → back to Main.java
5. Press `<Ctrl-i>` → forward to UserService.java

### View Jump List

```vim
:jumps
```

Shows history of jumps. Each jump has a number.

## Search and Navigation

### Fuzzy File Search

```
<Space>ff
```

Type partial path or filename:
- `UserS` - matches UserService.java
- `model/User` - matches com/example/model/User.java

### Live Grep

Search text across all files:

```
<Space>fg
```

Type search query, see results in real-time:
- Shows matching lines
- Preview context
- Press `Enter` to jump

**Example searches:**
- `public class` - Find all class declarations
- `TODO` - Find all TODO comments
- `@Override` - Find all overridden methods

### Search Current Word

Place cursor on word and press:

```
<Space>fw
```

Searches for the word under cursor across entire project.

## Practical Navigation Workflows

### Workflow 1: Understanding Unknown Code

Starting point: `Main.java`

```java
UserController controller = new UserController();
controller.createUser("Alice", "alice@example.com");
```

Navigation steps:
1. Cursor on `UserController`, press `gd` → Opens UserController.java
2. Find `createUser` method, cursor on `UserService`, press `gd` → Opens UserService.java
3. Find implementation details, cursor on `User`, press `gd` → Opens User.java
4. Press `<Ctrl-o>` repeatedly to retrace steps back to Main.java

### Workflow 2: Refactoring Impact Analysis

Want to change a method signature:

```java
public void processUser(User user) {
    // implementation
}
```

Steps:
1. Cursor on `processUser`, press `gr` - See all callers
2. Review each reference
3. Make changes
4. Use `gr` again to verify all fixed

### Workflow 3: Finding Implementation

Given an interface:

```java
public interface UserRepository {
    User findById(Long id);
}
```

Steps:
1. Cursor on interface name, press `gi` → Shows all implementations
2. Select implementation to view
3. Press `<Ctrl-o>` to return

### Workflow 4: Exploring Dependencies

In a service class:

```java
@Service
public class OrderService {
    private final UserService userService;
    private final ProductService productService;
}
```

Steps:
1. Press `<Space>ds` to see all symbols in file
2. Find field declarations
3. Press `gd` on each service to explore
4. Use `<Ctrl-o>` to navigate back

## Advanced Navigation Techniques

### Navigate to Related Files

Use Telescope with smart queries:

```vim
:Telescope find_files search=Test
```

Finds all test files.

### Search by File Pattern

```
<Space>ff
```

Then type patterns:
- `*Controller.java` - All controllers
- `*Test.java` - All tests
- `*/model/*.java` - All model classes

### Custom Symbol Search

Search specific symbol types:

```vim
:lua require('telescope.builtin').lsp_document_symbols({
  symbols = 'method'
})
```

Shows only methods.

## Marks for Navigation

### Setting Marks

Mark important locations:

```
m<letter>
```

Examples:
- `ma` - Set mark 'a'
- `mb` - Set mark 'b'
- `mM` - Set global mark 'M' (accessible from any file)

### Jumping to Marks

```
'<letter>
```

Examples:
- `'a` - Jump to mark 'a'
- `'M` - Jump to global mark 'M'

### View All Marks

```vim
:marks
```

### Practical Mark Usage

1. Mark your "home base" in Main.java: `mH`
2. Mark service entry point: `mS`
3. Mark model definition: `mM`
4. Jump between them: `'H`, `'S`, `'M`

## Telescope Navigation Summary

| Key | Command | Purpose |
|-----|---------|---------|
| `<Space>ff` | Find files | Open any file |
| `<Space>fg` | Live grep | Search text |
| `<Space>fw` | Grep word | Search word under cursor |
| `<Space>fb` | Buffers | Switch buffers |
| `<Space>fr` | Recent files | Recently opened |
| `<Space>ds` | Document symbols | Symbols in file |
| `<Space>ws` | Workspace symbols | Symbols in project |

## LSP Navigation Summary

| Key | Command | Purpose |
|-----|---------|---------|
| `gd` | Go to definition | Jump to where defined |
| `gD` | Go to declaration | Jump to declaration |
| `gi` | Go to implementation | Find implementations |
| `gy` | Go to type definition | Jump to type |
| `gr` | Find references | See all usages |
| `K` | Hover docs | Show documentation |
| `<Space>ca` | Code actions | Context actions |
| `<Space>rn` | Rename | Rename symbol |

## Practice Exercises

### Exercise 1: Code Archaeology

Given a method call in Main.java:

```java
orderService.processOrder(order);
```

Navigate to:
1. The `OrderService` class definition
2. The `processOrder` method implementation
3. All places that call `processOrder`
4. The `Order` class definition
5. Return to Main.java

### Exercise 2: Interface Explorer

Find all implementations of `Comparable` in your project:

1. Create a class implementing Comparable
2. Use `gi` to find all implementations
3. Explore each one

### Exercise 3: Refactoring Exploration

Pick a method, then:
1. Find all callers with `gr`
2. Find what it calls (read the code)
3. Find the types it uses with `gd`
4. Navigate the dependency tree

## Tips for Effective Navigation

1. **Use `gd` aggressively** - Don't scroll to find definitions
2. **Trust `<Ctrl-o>`** - Jump fearlessly, you can always go back
3. **Combine with splits** - Open definition in new split with `<Ctrl-w>gd`
4. **Use marks for anchors** - Mark your starting point before deep dives
5. **Leverage fuzzy finding** - Often faster than tree navigation
6. **Read hover docs** - Press `K` to understand before jumping

---
## What's Next?

In [Lesson 8: Debugging]({{< relref "/tutorial/08-debugging" >}}), you'll learn to debug Java applications right from Neovim.
