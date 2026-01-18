---
title: "Lesson 9: Testing"
weight: 90
bookToc: true
---

# Lesson 9: Testing

In this lesson, you'll learn to write, run, and manage JUnit tests directly from Neovim.

## Learning Objectives

By the end of this lesson, you'll be able to:
- Write JUnit tests
- Run individual tests
- Run test classes and test suites
- Interpret test results
- Debug failing tests
- Use test-driven development workflow

## JUnit Basics

### Test Structure

A typical JUnit test class:

```java
package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {

    @Test
    public void testAdd() {
        Calculator calc = new Calculator();
        int result = calc.add(2, 3);
        assertEquals(5, result);
    }

    @Test
    public void testDivide() {
        Calculator calc = new Calculator();
        int result = calc.divide(10, 2);
        assertEquals(5, result);
    }

    @Test(expected = ArithmeticException.class)
    public void testDivideByZero() {
        Calculator calc = new Calculator();
        calc.divide(10, 0);  // Should throw exception
    }
}
```

### Common Assertions

```java
assertEquals(expected, actual);
assertTrue(condition);
assertFalse(condition);
assertNull(object);
assertNotNull(object);
assertSame(expected, actual);  // Same reference
assertArrayEquals(expectedArray, actualArray);
```

## Running Tests in Neovim

### Run Tests via Build Tool

The most reliable way to run tests is using your build tool directly:

**Maven:**
```vim
:!mvn test
```

**Gradle:**
```vim
:!gradle test
```

**Run specific test class:**
```vim
:!mvn test -Dtest=CalculatorTest
```

**Run specific test method:**
```vim
:!mvn test -Dtest=CalculatorTest#testAdd
```

### IDE-Style Test Running (Optional)

For IDE-style test running (run test under cursor), you can configure additional keybindings with nvim-jdtls. Check the jdtls documentation for available test commands.

Alternatively, use a terminal split to keep tests running continuously (see Continuous Testing Workflow section below).

## Test Results

### Results Display

After running tests, you'll see:

```
✓ testAdd - PASSED
✓ testSubtract - PASSED
✗ testDivide - FAILED
  Expected: 5
  Actual: 0
  at CalculatorTest.testDivide(CalculatorTest.java:15)
```

### Understanding Results

| Symbol | Status |
|--------|--------|
| ✓ | Passed |
| ✗ | Failed |
| ⊗ | Error |
| ⊘ | Skipped |

### Navigating to Failures

Test results are usually clickable:
1. Click on failure
2. Or navigate with `j`/`k` and press `Enter`
3. Jumps to failing test line

## Creating Test Files

### Test File Location

Tests go in parallel structure:

```
src/
├── main/java/com/example/
│   └── Calculator.java
└── test/java/com/example/
    └── CalculatorTest.java
```

### Creating Test for Class

1. Open source file (e.g., `Calculator.java`)
2. Press `<Space>ca` (code actions)
3. Look for "Generate tests" or create manually

### Manual Test Creation

1. Create file in test directory
2. Name it `<ClassName>Test.java`
3. Add test structure:

```java
package com.example;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;

public class CalculatorTest {
    private Calculator calculator;

    @Before
    public void setUp() {
        calculator = new Calculator();
    }

    @Test
    public void testMethodName() {
        // Arrange
        // Act
        // Assert
    }
}
```

## Test-Driven Development (TDD)

### TDD Workflow

1. **Write failing test**
2. **Run test** (should fail)
3. **Write minimal code** to pass
4. **Run test** (should pass)
5. **Refactor**
6. **Repeat**

### Example TDD Session

**Step 1: Write failing test**

```java
@Test
public void testCalculateDiscount() {
    PriceCalculator calc = new PriceCalculator();
    double price = calc.calculateDiscount(100.0, 10);  // 10% discount
    assertEquals(90.0, price, 0.01);
}
```

Run `:!mvn test -Dtest=PriceCalculatorTest#testCalculateDiscount` - Test fails (class doesn't exist).

**Step 2: Create minimal implementation**

```java
public class PriceCalculator {
    public double calculateDiscount(double price, int percent) {
        return 0;  // Minimal code
    }
}
```

Run test again - Test still fails (returns 0).

**Step 3: Make it pass**

```java
public class PriceCalculator {
    public double calculateDiscount(double price, int percent) {
        return price - (price * percent / 100.0);
    }
}
```

Run test - Test passes! ✓

**Step 4: Add more tests**

```java
@Test
public void testCalculateDiscountWithZeroPercent() {
    PriceCalculator calc = new PriceCalculator();
    assertEquals(100.0, calc.calculateDiscount(100.0, 0), 0.01);
}

@Test
public void testCalculateDiscountWithHundredPercent() {
    PriceCalculator calc = new PriceCalculator();
    assertEquals(0.0, calc.calculateDiscount(100.0, 100), 0.01);
}
```

Run `:!mvn test -Dtest=PriceCalculatorTest` - Run all tests in the class.

## Debugging Tests

### Debug Single Test

1. Set breakpoint in test method: `<Space>db`
2. Use jdtls test commands or run with Maven/Gradle in debug mode
3. Step through code with debug controls (see Lesson 8: Debugging)

### Debug Failing Test

When test fails:

1. Set breakpoint at assertion: `<Space>db`
2. Run test with your build tool
3. Use debug controls to step through
4. Inspect variables in the Variables pane
5. Find and fix the issue

## Test Organization

### Test Suites

Group related tests:

```java
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({
    CalculatorTest.class,
    PriceCalculatorTest.class,
    StringUtilsTest.class
})
public class AllTests {
}
```

Run suite:
```vim
:!mvn test -Dtest=AllTests
```

### Test Categories

Use JUnit categories:

```java
public interface SlowTests {}
public interface FastTests {}

public class CalculatorTest {
    @Test
    @Category(FastTests.class)
    public void testAdd() {
        // Fast test
    }

    @Test
    @Category(SlowTests.class)
    public void testComplexCalculation() {
        // Slow test
    }
}
```

Run only fast tests:
```vim
:!mvn test -Dgroups=FastTests
```

## Advanced Testing Patterns

### Parameterized Tests

Test with multiple inputs:

```java
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

@RunWith(Parameterized.class)
public class CalculatorParameterizedTest {
    private int input1;
    private int input2;
    private int expected;

    public CalculatorParameterizedTest(int input1, int input2, int expected) {
        this.input1 = input1;
        this.input2 = input2;
        this.expected = expected;
    }

    @Parameters
    public static Collection<Object[]> data() {
        return Arrays.asList(new Object[][] {
            {1, 1, 2},
            {2, 3, 5},
            {10, 20, 30},
            {-5, 5, 0}
        });
    }

    @Test
    public void testAdd() {
        Calculator calc = new Calculator();
        assertEquals(expected, calc.add(input1, input2));
    }
}
```

### Test Fixtures

Setup and teardown:

```java
public class DatabaseTest {
    private Database db;

    @Before
    public void setUp() {
        db = new Database();
        db.connect();
    }

    @After
    public void tearDown() {
        db.disconnect();
    }

    @BeforeClass
    public static void setUpClass() {
        // Runs once before all tests
    }

    @AfterClass
    public static void tearDownClass() {
        // Runs once after all tests
    }

    @Test
    public void testQuery() {
        // db is connected
    }
}
```

### Mocking with Mockito

```java
import static org.mockito.Mockito.*;

public class UserServiceTest {
    @Test
    public void testGetUser() {
        // Create mock
        UserRepository mockRepo = mock(UserRepository.class);

        // Define behavior
        User mockUser = new User("Alice");
        when(mockRepo.findById(1L)).thenReturn(mockUser);

        // Test
        UserService service = new UserService(mockRepo);
        User result = service.getUser(1L);

        // Verify
        assertEquals("Alice", result.getName());
        verify(mockRepo).findById(1L);
    }
}
```

## Test Coverage

### View Coverage

Run tests with coverage:

```bash
mvn test jacoco:report
```

Coverage report in: `target/site/jacoco/index.html`

Open in browser:
```vim
:!open target/site/jacoco/index.html
```

### Coverage in Neovim

Some plugins show coverage inline (green/red gutters). Check if available:

```vim
:checkhealth
```

## Common Testing Patterns

### AAA Pattern

Arrange-Act-Assert:

```java
@Test
public void testUserCreation() {
    // Arrange
    String name = "Alice";
    String email = "alice@example.com";

    // Act
    User user = new User(name, email);

    // Assert
    assertEquals(name, user.getName());
    assertEquals(email, user.getEmail());
}
```

### Testing Exceptions

```java
@Test(expected = IllegalArgumentException.class)
public void testInvalidInput() {
    Calculator calc = new Calculator();
    calc.divide(10, 0);
}

// Or with try-catch:
@Test
public void testInvalidInputWithMessage() {
    try {
        Calculator calc = new Calculator();
        calc.divide(10, 0);
        fail("Expected exception");
    } catch (IllegalArgumentException e) {
        assertEquals("Cannot divide by zero", e.getMessage());
    }
}
```

### Testing Async Code

```java
@Test(timeout = 1000)  // Fails if takes > 1 second
public void testAsyncOperation() throws Exception {
    CompletableFuture<String> future = asyncService.getData();
    String result = future.get();
    assertEquals("expected", result);
}
```

## Continuous Testing Workflow

### Watch Mode

Keep tests running automatically:

1. Open terminal split: `<Space>sv` then open terminal
2. Run watch command:
   ```bash
   mvn test -Dtest=MyTest --watch
   ```

Or use gradle:
```bash
gradle test --continuous
```

### Workflow

1. Write code in left split
2. Tests run automatically in right split
3. See immediate feedback
4. Red → Green → Refactor

## Practice Exercises

### Exercise 1: TDD Kata

Implement `StringCalculator.add(String numbers)`:

1. Empty string returns 0
2. Single number returns that number
3. Two numbers, comma separated, return sum
4. Handle new lines between numbers
5. Throw exception for negatives

Write tests first, then implementation!

### Exercise 2: Test Existing Code

Pick a class from earlier lessons:

1. Write comprehensive tests
2. Aim for 100% coverage
3. Test edge cases
4. Test error conditions

### Exercise 3: Refactoring with Tests

Take complex method:

1. Write tests for current behavior
2. Refactor code
3. Run tests to ensure behavior unchanged
4. Tests give confidence!

## Tips for Effective Testing

1. **Test behavior, not implementation** - Don't test private methods
2. **One assertion per test** - Makes failures clear
3. **Descriptive test names** - `testAddWithNegativeNumbers()`
4. **Fast tests** - Mock external dependencies
5. **Independent tests** - Each test should run standalone
6. **Use setUp/tearDown** - Don't repeat initialization
7. **Test edge cases** - Zero, null, negative, boundary values

## Testing Commands Summary

| Command | Action |
|---------|--------|
| `:!mvn test` | Run all tests |
| `:!mvn test -Dtest=ClassName` | Run specific test class |
| `:!mvn test -Dtest=ClassName#methodName` | Run specific test method |
| `:!gradle test` | Run all tests (Gradle) |
| `<Space>db` | Set breakpoint for debugging |
| `<Space>dc` | Start debugging session |

---
## What's Next?

In [Lesson 10: Common Workflows]({{< relref "/tutorial/10-common-workflows" >}}), you'll put everything together with real-world development scenarios.
