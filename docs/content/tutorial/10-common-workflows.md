---
title: "Lesson 10: Common Workflows"
weight: 100
bookToc: true
---

# Lesson 10: Common Workflows

In this final lesson, you'll learn real-world workflows that combine everything you've learned into productive development patterns.

## Learning Objectives

By the end of this lesson, you'll be able to:
- Implement new features efficiently
- Fix bugs systematically
- Refactor code safely
- Work with existing codebases
- Optimize your development workflow

## Workflow 1: Implementing a New Feature

### Scenario: Add User Authentication

Let's implement a complete authentication feature.

### Step 1: Plan the Implementation

Create a TODO list (use comments or `:TodoWrite`):

```
- Create User model
- Create AuthService
- Implement login method
- Implement logout method
- Add password hashing
- Write tests
```

### Step 2: Create Package Structure

```vim
:!mkdir -p src/main/java/com/example/auth/{model,service}
:!mkdir -p src/test/java/com/example/auth/service
```

### Step 3: Create Model (TDD Style)

**Write test first:**

1. `<Space>ff` → `AuthServiceTest.java`
2. Write failing test:

```java
package com.example.auth.service;

import org.junit.Test;
import static org.junit.Assert.*;

public class AuthServiceTest {
    @Test
    public void testLogin() {
        AuthService auth = new AuthService();
        boolean result = auth.login("user", "password");
        assertTrue(result);
    }
}
```

3. `<Space>jt` - Test fails (class doesn't exist)

**Create implementation:**

1. `<Space>ff` → `AuthService.java`
2. Quick implementation:

```java
package com.example.auth.service;

public class AuthService {
    public boolean login(String username, String password) {
        return false;  // Minimal code
    }
}
```

3. `<Space>jt` - Test still fails
4. Fix implementation
5. `<Space>jt` - Test passes ✓

### Step 4: Iterate

Repeat TDD cycle for each feature:
- Logout
- Password validation
- Token generation
- Session management

### Step 5: Integration

1. `<Space>ff` → Open `Main.java`
2. Add authentication:

```java
AuthService auth = new AuthService();
if (auth.login(username, password)) {
    // Continue
}
```

3. Use `gd` to jump between related files
4. Use `<Ctrl-o>` to jump back

### Step 6: Final Testing

1. Run all tests: `:!mvn test`
2. Fix any failures
3. Check coverage
4. Commit changes

## Workflow 2: Bug Fixing

### Scenario: NullPointerException in Production

### Step 1: Reproduce the Bug

1. Read stack trace
2. Find the line: `UserService.java:42`
3. `<Space>ff` → Type "UserServ:42" → Opens file at line 42

### Step 2: Write Failing Test

```java
@Test
public void testGetUserWithNullId() {
    UserService service = new UserService();
    User result = service.getUser(null);
    assertNull(result);  // Should handle gracefully
}
```

Run: `<Space>jt` - Fails with NPE

### Step 3: Debug

1. `<Space>db` - Set breakpoint at line 42
2. `<Space>dc` - Run in debug mode
3. Inspect variables
4. Find null check is missing

### Step 4: Fix

```java
public User getUser(Long id) {
    if (id == null) {
        return null;  // Or throw exception
    }
    return repository.findById(id);
}
```

### Step 5: Verify

1. `<Space>jt` - Test passes ✓
2. Run full suite: `:!mvn test`
3. Check no regressions

### Step 6: Find All Similar Issues

1. `<Space>fg` - Grep for similar patterns
2. Search: `findById(`
3. Review each occurrence
4. Add null checks where needed

## Workflow 3: Refactoring

### Scenario: Extract Service from Controller

### Step 1: Identify Code to Extract

Current messy controller:

```java
public class UserController {
    public void createUser(String name, String email) {
        // Validation
        if (name == null || name.isEmpty()) {
            throw new IllegalArgumentException("Name required");
        }

        // Business logic
        User user = new User(name, email);
        user.setCreatedAt(new Date());

        // Persistence
        database.save(user);
    }
}
```

### Step 2: Write Tests for Current Behavior

```java
@Test
public void testCreateUser() {
    UserController controller = new UserController();
    controller.createUser("Alice", "alice@example.com");
    // Verify behavior
}
```

Run: `<Space>jT` - All pass (baseline)

### Step 3: Create Service Class

1. `<Space>ff` → Create `UserService.java`
2. Use Visual mode to select business logic
3. `<Space>ca` → "Extract to method"

Move to new service:

```java
public class UserService {
    public User createUser(String name, String email) {
        if (name == null || name.isEmpty()) {
            throw new IllegalArgumentException("Name required");
        }
        User user = new User(name, email);
        user.setCreatedAt(new Date());
        return user;
    }
}
```

### Step 4: Update Controller

```java
public class UserController {
    private UserService userService = new UserService();

    public void createUser(String name, String email) {
        User user = userService.createUser(name, email);
        database.save(user);
    }
}
```

### Step 5: Run Tests

`<Space>jT` - All still pass ✓

Refactoring successful!

### Step 6: Update References

1. Cursor on `UserService`
2. `gr` - Find all references
3. Verify all usages make sense
4. Update as needed

## Workflow 4: Working with Unknown Codebase

### Scenario: Fix Bug in Unfamiliar Project

### Step 1: Find Entry Point

1. `<Space>fg` - Search for "main"
2. Find `Main.java`
3. Read through main method

### Step 2: Trace Execution

1. Cursor on method call
2. `gd` - Go to definition
3. Repeat to build mental map
4. Use `<Ctrl-o>` to backtrack

### Step 3: Search for Domain Terms

1. `<Space>fg` - Grep for business terms
2. Search: "payment", "order", etc.
3. Find relevant code sections

### Step 4: Explore Package Structure

1. `<Space>ne` - Open file tree
2. Browse package organization
3. Understand layers (model, service, controller)

### Step 5: Find Related Code

1. `<Space>ws` - Workspace symbols
2. Search for class names
3. Use `gr` to find usages

### Step 6: Document as You Go

Create notes file:

```markdown
# Codebase Notes

## Architecture
- MVC pattern
- Service layer handles business logic
- Repository pattern for data access

## Key Classes
- OrderService - Main business logic
- PaymentGateway - External integration
- UserRepository - Database access

## Issues Found
- No null checks in OrderService.process()
- Missing validation in PaymentGateway
```

## Workflow 5: Code Review

### Scenario: Review Pull Request

### Step 1: Check Out Branch

```bash
git fetch origin
git checkout feature-branch
```

### Step 2: Open Changed Files

```bash
git diff main --name-only
```

Open each file: `<Space>ff`

### Step 3: Review Changes

1. `<Space>fg` - Search for patterns
2. Look for:
   - Missing null checks
   - No error handling
   - Hardcoded values
   - Missing tests

### Step 4: Test Locally

1. Run tests: `:!mvn test`
2. Check coverage
3. Run application
4. Test edge cases

### Step 5: Leave Comments

Create notes or use GitHub CLI:

```bash
gh pr review --comment "Add null check on line 42"
```

## Workflow 6: Performance Optimization

### Scenario: Slow API Endpoint

### Step 1: Profile

Add timing logs:

```java
long start = System.currentTimeMillis();
result = expensiveOperation();
long duration = System.currentTimeMillis() - start;
System.out.println("Duration: " + duration + "ms");
```

### Step 2: Identify Bottleneck

1. Run with debug logging
2. Find slow section
3. `gd` to jump to implementation

### Step 3: Optimize

Common fixes:
- Add caching
- Reduce database queries
- Use bulk operations
- Lazy load data

### Step 4: Measure Impact

1. Add before/after timing
2. Run tests: `<Space>jT`
3. Compare results

### Step 5: Check for Regressions

1. Run full test suite
2. Verify correctness maintained
3. Check edge cases still work

## Workflow 7: Dependency Update

### Scenario: Upgrade Library Version

### Step 1: Update pom.xml

```xml
<dependency>
    <groupId>com.example</groupId>
    <artifactId>library</artifactId>
    <version>2.0.0</version> <!-- was 1.0.0 -->
</dependency>
```

### Step 2: Check Breaking Changes

1. Read changelog
2. Search usage: `<Space>fg` → "import com.example.library"
3. Review all usages

### Step 3: Update API Calls

1. Find deprecated methods
2. `gr` to find all usages
3. Update each one
4. Use code actions for quick fixes

### Step 4: Run Tests

1. `:!mvn test`
2. Fix failures
3. Update tests as needed

### Step 5: Manual Testing

1. Run application
2. Test affected features
3. Verify behavior unchanged

## Workflow 8: Git Integration

### Scenario: Feature Development with Git

### Step 1: Create Feature Branch

```bash
git checkout -b feature/user-authentication
```

### Step 2: Make Changes

1. Implement feature
2. Use all Neovim tools
3. Test thoroughly

### Step 3: Stage Changes

```vim
:!git add src/main/java/com/example/auth
:!git status
```

### Step 4: Commit

```vim
:!git commit -m "Add user authentication feature"
```

### Step 5: Push and Create PR

```bash
git push -u origin feature/user-authentication
gh pr create --title "Add user authentication"
```

## Power User Tips

### Tip 1: Custom Keybindings

Add frequent commands to config:

```lua
vim.keymap.set('n', '<leader>tr', ':!mvn test<CR>', { desc = 'Run tests' })
vim.keymap.set('n', '<leader>tc', ':!mvn clean<CR>', { desc = 'Clean' })
```

### Tip 2: Project-Specific Config

Create `.nvim.lua` in project root:

```lua
-- Project-specific settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
```

### Tip 3: Terminal Integration

Use toggleterm for better terminal:

```
<Space>tf  - Floating terminal
<Space>th  - Horizontal terminal
<Space>tv  - Vertical terminal
```

### Tip 4: Session Management

Save your workspace:

```vim
:mksession! ~/sessions/myproject.vim
```

Restore later:

```bash
nvim -S ~/sessions/myproject.vim
```

### Tip 5: Quick Navigation Marks

Set global marks for frequent files:

```vim
mM  - Mark Main.java
mS  - Mark Service
mT  - Mark Test

'M  - Jump to Main
'S  - Jump to Service
'T  - Jump to Test
```

## Productivity Checklist

Daily workflow checklist:

- [ ] `<Space>ff` - Quick file navigation
- [ ] `gd` / `gr` - Jump to code
- [ ] `<Space>ca` - Use code actions
- [ ] `<Space>jt` - Run tests frequently
- [ ] `K` - Read documentation
- [ ] `<Space>db` - Debug when stuck
- [ ] `:w` - Save often
- [ ] Commit early and often

## Resources

- [Quick Reference]({{< relref "/quick-reference" >}}) - Keybinding cheat sheet
- [Neovim Documentation](https://neovim.io/doc/)
- [nvim-java GitHub](https://github.com/nvim-java/nvim-java)
- [Vim Tutor](vimtutor) - Built-in Vim tutorial

## Congratulations!

You've completed all 10 lessons of the Neovim4j tutorial!

You now know how to:
- Set up Java projects
- Write code with intelligent completion
- Navigate large codebases
- Debug applications
- Write and run tests
- Use real-world development workflows

## Next Steps

1. **Practice daily** - Use Neovim for all Java development
2. **Customize your config** - Make it yours
3. **Learn more Vim** - Run `:Tutor` for Vim fundamentals
4. **Explore plugins** - Add tools as needed
5. **Join community** - GitHub discussions, Reddit r/neovim


---
Happy coding with Neovim4j!
