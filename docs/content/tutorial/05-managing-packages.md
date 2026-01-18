---
title: "Lesson 5: Managing Packages"
weight: 50
bookToc: true
---

# Lesson 5: Managing Packages

In this lesson, you'll learn how to organize Java code using packages and navigate package structures efficiently.

## Learning Objectives

By the end of this lesson, you'll be able to:
- Understand Java package structure
- Create new packages
- Move classes between packages
- Navigate package hierarchies
- Handle package declarations and imports

## Understanding Java Packages

Packages are Java's way of organizing related classes. They:
- Prevent naming conflicts
- Control access with package-private visibility
- Make code easier to find and maintain
- Map to directory structure

### Package Naming Conventions

Standard format: `com.company.project.module`

Example:
```
com.example.myapp.model
com.example.myapp.service
com.example.myapp.controller
```

## Creating Package Structure

### Using File Explorer

1. Open file explorer: `<Space>ne`
2. Navigate to `src/main/java/`
3. Press `a` to create
4. Type directory path: `com/example/myapp/model`
5. Press `Enter`

Repeat for other packages:
- `com/example/myapp/service`
- `com/example/myapp/controller`
- `com/example/myapp/util`

### Using Command Line

```bash
mkdir -p src/main/java/com/example/myapp/{model,service,controller,util}
```

### Using Neovim Command

```vim
:!mkdir -p src/main/java/com/example/myapp/model
```

## Creating Classes in Packages

### Example Project Structure

Let's build a simple user management system:

```
src/main/java/com/example/myapp/
├── model/
│   ├── User.java
│   └── Role.java
├── service/
│   └── UserService.java
├── controller/
│   └── UserController.java
└── Main.java
```

### Step 1: Create Model Classes

**Create `User.java` in model package:**

1. `<Space>ff` (find files)
2. Type: `src/main/java/com/example/myapp/model/User.java`
3. Press `Enter` to create
4. Add code:

```java
package com.example.myapp.model;

public class User {
    private Long id;
    private String username;
    private String email;
    private Role role;

    public User(Long id, String username, String email, Role role) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.role = role;
    }

    // Generate getters with <Space>ca
    public Long getId() { return id; }
    public String getUsername() { return username; }
    public String getEmail() { return email; }
    public Role getRole() { return role; }
}
```

**Create `Role.java` in model package:**

```java
package com.example.myapp.model;

public enum Role {
    ADMIN,
    USER,
    GUEST
}
```

### Step 2: Create Service Class

**Create `UserService.java`:**

```java
package com.example.myapp.service;

import com.example.myapp.model.User;
import com.example.myapp.model.Role;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    private List<User> users = new ArrayList<>();

    public void addUser(User user) {
        users.add(user);
    }

    public List<User> getAllUsers() {
        return new ArrayList<>(users);
    }

    public User findById(Long id) {
        return users.stream()
            .filter(u -> u.getId().equals(id))
            .findFirst()
            .orElse(null);
    }
}
```

**Auto-import shortcut:**
- Type `User` and accept completion - import is added automatically
- Or press `<Space>ca` → "Add import"

### Step 3: Create Controller Class

**Create `UserController.java`:**

```java
package com.example.myapp.controller;

import com.example.myapp.model.User;
import com.example.myapp.model.Role;
import com.example.myapp.service.UserService;

public class UserController {
    private UserService userService;

    public UserController() {
        this.userService = new UserService();
    }

    public void createUser(Long id, String username, String email, Role role) {
        User user = new User(id, username, email, role);
        userService.addUser(user);
    }

    public void listUsers() {
        userService.getAllUsers().forEach(user -> {
            System.out.println(user.getUsername() + " - " + user.getEmail());
        });
    }
}
```

### Step 4: Create Main Class

**Create `Main.java` in base package:**

```java
package com.example.myapp;

import com.example.myapp.controller.UserController;
import com.example.myapp.model.Role;

public class Main {
    public static void main(String[] args) {
        UserController controller = new UserController();

        controller.createUser(1L, "alice", "alice@example.com", Role.ADMIN);
        controller.createUser(2L, "bob", "bob@example.com", Role.USER);

        System.out.println("All users:");
        controller.listUsers();
    }
}
```

## Navigating Package Structure

### Using File Explorer

| Key | Action |
|-----|--------|
| `<Space>ne` | Toggle file tree |
| `o` or `Enter` | Open file/expand folder |
| `-` | Go up to parent directory |
| `/` | Search in tree |

### Using Fuzzy Finder

| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep in files |
| `<Space>fb` | Browse buffers |
| `<Space>fr` | Recent files |

**Tips:**
- Type partial path: `model/User` finds `*/model/User.java`
- Type class name: `UserService` finds the file
- Fuzzy matching: `UsrServ` finds `UserService.java`

### Jumping to Related Files

With cursor on a class name:

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find references |
| `<Ctrl-o>` | Jump back |
| `<Ctrl-i>` | Jump forward |

## Moving Classes Between Packages

### Method 1: Cut and Paste in File Tree

1. `<Space>ne` - Open file tree
2. Navigate to file
3. Press `x` - Cut file
4. Navigate to target package directory
5. Press `p` - Paste

Don't forget to update the package declaration!

### Method 2: Manual Move

1. Move the file in file tree or with shell command
2. Update package declaration at top of file
3. Press `<Space>ca` → "Organize imports" to fix imports

### Method 3: Rename with LSP

1. Open the file
2. Change the package declaration manually
3. Save the file
4. Use code actions to fix any import issues in other files

## Organizing Imports

### Auto-Organize

Press `<Space>ca` and select:
- "Organize imports" - Removes unused, sorts imports
- "Add import" - Import a specific class

### Import Shortcuts

When you see an error about missing class:

1. Cursor on the unresolved class name
2. Press `<Space>ca`
3. Select the correct import

## Package Best Practices

### 1. Logical Grouping

Group by feature or layer:

```
com.example.myapp/
├── model/          # Data classes
├── service/        # Business logic
├── controller/     # Request handlers
├── repository/     # Data access
└── util/           # Utilities
```

### 2. Package-Private Access

Use package-private (no modifier) for internal classes:

```java
class InternalHelper {  // Only visible in package
    // ...
}

public class PublicService {  // Visible everywhere
    // ...
}
```

### 3. Avoid Cyclic Dependencies

Don't let packages depend on each other in circles:

```
❌ model → service → model  (circular)
✅ controller → service → model  (unidirectional)
```

## Common Package Patterns

### Layer-Based Structure

```
com.example.myapp/
├── model/
├── dao/
├── service/
├── controller/
└── util/
```

### Feature-Based Structure

```
com.example.myapp/
├── user/
│   ├── User.java
│   ├── UserService.java
│   └── UserController.java
├── product/
│   ├── Product.java
│   └── ProductService.java
└── order/
    ├── Order.java
    └── OrderService.java
```

## Practice Exercise

Create a mini library system:

### Requirements

Packages:
- `com.example.library.model` - Book, Author, Member
- `com.example.library.service` - LibraryService
- `com.example.library` - Main

### Classes to Create

**Book.java:**
```java
package com.example.library.model;

public class Book {
    private String isbn;
    private String title;
    private Author author;
    // constructor, getters
}
```

**Author.java:**
```java
package com.example.library.model;

public class Author {
    private String name;
    private String nationality;
    // constructor, getters
}
```

**LibraryService.java:**
```java
package com.example.library.service;

import com.example.library.model.Book;
import java.util.ArrayList;
import java.util.List;

public class LibraryService {
    private List<Book> books = new ArrayList<>();

    public void addBook(Book book) {
        books.add(book);
    }

    public List<Book> getAllBooks() {
        return books;
    }
}
```

Practice:
1. Create package structure
2. Create all classes
3. Use code actions to generate boilerplate
4. Use auto-imports
5. Navigate between files with `gd` and `<Ctrl-o>`

---
## What's Next?

In [Lesson 6: Buffer Navigation]({{< relref "/tutorial/06-buffer-navigation" >}}), you'll learn to work efficiently with multiple files open.
