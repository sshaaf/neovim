---
title: "Installation"
weight: 1
bookToc: true
---

# How to Install

## Prerequisites

Before starting, ensure you have the following installed:

### Required
- [Neovim](https://neovim.io/doc/install/) v0.11+ (earlier versions may work but are untested)
- [Git](https://git-scm.com/) - for plugin management
- JDK 11 or later - [SDKMan](https://sdkman.io/install/) is recommended for Java installation
- [ripgrep (rg)](https://github.com/BurntSushi/ripgrep) - for Telescope file searching
- [fd](https://github.com/sharkdp/fd) - for Telescope extended file finding capabilities
- A [Nerd Font](https://www.nerdfonts.com/) installed and configured in your terminal

## First Time Setup

1. Clone this configuration to your Neovim config directory:
```bash
git clone <your-repo-url> ~/.config/nvim
```

2. Open Neovim for the first time:
```bash
nvim
```

3. Lazy.nvim will automatically:
   - Install all plugins including `nvim-jdtls` (Java LSP client)
   - Install the Java language server (jdtls) via Mason
   - Set up debugging support with nvim-dap

   Wait for all installations to complete (you'll see progress notifications).

4. Verify installation by running:
```vim
:checkhealth
```

All checks should pass except for optional warnings (which can be ignored).

## Optional: AI Assistant Setup

Neovim4j includes **CodeCompanion.nvim** for AI-assisted coding using self-hosted LLMs via Ollama.

### Installing Ollama

1. **Install Ollama** (choose your platform):

   **macOS:**
   ```bash
   brew install ollama
   ```

   **Linux:**
   ```bash
   curl -fsSL https://ollama.com/install.sh | sh
   ```

   **Or download from:** [ollama.com](https://ollama.com)

2. **Start Ollama service:**
   ```bash
   ollama serve
   ```

3. **Pull a code model** (recommended for Java development):
   ```bash
   ollama pull deepseek-coder:6.7b
   ```

   **Alternative models:**
   - `ollama pull qwen2.5-coder:7b` - Excellent code understanding
   - `ollama pull codellama:13b` - Solid all-around model
   - `ollama pull starcoder2:15b` - Good for completions

4. **Verify Ollama is running:**
   ```bash
   curl http://localhost:11434/api/tags
   ```

### Using the AI Assistant

Once Ollama is running with a model downloaded:

- `<Space>ac` - Open AI chat
- `<Space>ae` - Edit selection with AI (visual mode)
- `<Space>ax` - Explain code (visual mode)
- `<Space>aa` - Show AI actions menu

See [Quick Reference]({{< relref "/quick-reference" >}}) for all AI keybindings.
