---
title: "Lesson 1: Project Setup"
weight: 10
bookToc: true
---

# Lesson 1: Project Setup

In this lesson, you'll learn how to create and open a Java project in Neovim.

## Learning Objectives

By the end of this lesson, you'll be able to:
- Create a simple Java project structure
- Create Maven and Gradle projects
- Open projects in Neovim
- Navigate the file explorer

## Creating a Simple Java Project

Let's start by creating a basic Java project structure manually:

```bash
# Create project directory
mkdir -p ~/java-projects/hello-neovim
cd ~/java-projects/hello-neovim

# Create standard Java directory structure
mkdir -p src/main/java/com/example
mkdir -p src/test/java/com/example
```

This creates the standard Maven/Gradle directory layout.

## Creating a Maven Project

For a Maven project, create a `pom.xml` file:

```bash
cd ~/java-projects
mkdir maven-demo
cd maven-demo
```

Create `pom.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>maven-demo</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.2</version>
            <scope>test</scope>
        </dependency>
    </dependencies>
</project>
```

Then create the directory structure:

```bash
mkdir -p src/main/java/com/example
mkdir -p src/test/java/com/example
```

## Creating a Gradle Project

For a Gradle project:

```bash
cd ~/java-projects
mkdir gradle-demo
cd gradle-demo
```

Create `build.gradle`:

```groovy
plugins {
    id 'java'
}

group = 'com.example'
version = '1.0-SNAPSHOT'

repositories {
    mavenCentral()
}

dependencies {
    testImplementation 'junit:junit:4.13.2'
}

java {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
}
```

Create directory structure:

```bash
mkdir -p src/main/java/com/example
mkdir -p src/test/java/com/example
```

## Opening a Project in Neovim

Now let's open your project:

```bash
# Navigate to project root
cd ~/java-projects/maven-demo

# Open Neovim in the project directory
nvim .
```

When you open Neovim with `.`, it opens in the current directory. The LSP (jdtls) will automatically detect your project type (Maven/Gradle) and configure itself.

## Using the File Explorer

Once Neovim is open, you can access the file explorer:

**Toggle file explorer:**
```
<Space>ne
```

(Press Space, then 'n', then 'e')

### File Explorer Navigation

In the file explorer (nvim-tree):

| Key | Action |
|-----|--------|
| `j` / `k` | Move down/up |
| `Enter` | Open file or expand directory |
| `o` | Open file |
| `a` | Create new file |
| `d` | Delete file |
| `r` | Rename file |
| `x` | Cut file |
| `c` | Copy file |
| `p` | Paste file |
| `R` | Refresh tree |
| `q` or `<Space>ne` | Close explorer |

### Creating Your First File

1. Open file explorer: `<Space>ne`
2. Navigate to `src/main/java/com/example/`
3. Press `a` to create a new file
4. Type: `Main.java`
5. Press Enter

The file will be created and opened in a buffer.

## Project Structure Overview

After setup, your project should look like:

```
maven-demo/
├── pom.xml                          (Maven build file)
├── src/
│   ├── main/
│   │   └── java/
│   │       └── com/
│   │           └── example/
│   │               └── Main.java    (Your code here)
│   └── test/
│       └── java/
│           └── com/
│               └── example/
│                   └── MainTest.java (Tests here)
```

## Tips

- **Auto-detection**: jdtls automatically detects Maven (`pom.xml`) or Gradle (`build.gradle`) projects
- **Workspace folders**: The first time you open a project, jdtls may take a moment to download dependencies
- **Check LSP status**: Run `:LspInfo` to verify jdtls is running
- **Check health**: Run `:checkhealth` if something isn't working

## Practice Exercise

1. Create a new Maven project called `my-first-project`
2. Open it in Neovim
3. Use the file explorer to create `Main.java` in the correct package
4. Verify jdtls is running with `:LspInfo`

---
## What's Next?

In [Lesson 2: Hello World]({{< relref "/tutorial/02-hello-world" >}}), you'll write your first Java program and run it.
