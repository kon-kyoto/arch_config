# 🧙 Neovim — Configuration

## 🚀 Installed Plugins

| Plugin | Description |
|--------|-------------|
| **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** | Tokyo Night theme with transparency |
| **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** | File manager |
| **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** | File and text search |
| **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** | File icons |
| **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** | Lua utilities |
| **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** | Syntax highlighting |
| **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** | LSP support (clangd) |
| **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** | Autocompletion |
| **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** | Snippets |
| **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** | Debugger (gdb) |
| **[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)** | Debugger UI |
| **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** | Code commenting |
| **[debugprint.nvim](https://github.com/andrewferrier/debugprint.nvim)** | Quick debug print insertion |

---

## ⌨️ Hotkeys

### General
| Key | Action |
|-----|--------|
| `Ctrl + k` | Exit insert mode |
| `<leader> + s` | Save file |
| `<leader> + q` | Close window |
| `<leader> + e` | Toggle file manager (NvimTree) |
| `<leader> + f` | Find files (Telescope) |
| `<leader> + Enter` | Compile C/C++ file |

> 💡 `<leader>` = spacebar

### LSP (for C/C++ files)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Show documentation |
| `<leader> + rn` | Rename symbol |
| `gr` | Find all references |

### Debugging (DAP)
| Key | Action |
|-----|--------|
| `F5` | Start/continue debugging |
| `F9` | Toggle breakpoint |
| `F10` | Step over |
| `F11` | Step into |
| `<leader> + du` | Toggle debugger UI |

### Autocompletion (nvim-cmp)
| Key | Action |
|-----|--------|
| `Ctrl + Space` | Manually trigger completion |
| `Tab` | Select next item |
| `Shift + Tab` | Select previous item |
| `Enter` | Confirm selection |

### DebugPrint
| Key | Action |
|-----|--------|
| `g?p` | Insert debug print |
| `g?v` | Insert print with variable under cursor |

---

## 🎨 Visual Features

| Feature | Description |
|---------|-------------|
| Theme | Tokyo Night (`night` style) |
| Transparent background | Yes (inherits terminal background) |
| Line numbers | Absolute + relative |
| File icons | Enabled (nvim-web-devicons) |
| Git highlighting in NvimTree | Enabled |

### UI Colors
| Element | Color |
|---------|-------|
| Normal text | From Tokyo Night theme |
| Background elements | Transparent (`bg = "none"`) |
| Menu selection | `#3b4261` |
| Window separators | `#565f89` |

---

## 🔧 Compiling C/C++

| Action | Description |
|--------|-------------|
| `<leader> + Enter` | Compile current file |

**Compilation process:**
1. Automatically saves the file
2. Formats via `clang-format`
3. Compiles with `-Wall -Wextra` flags
4. Outputs errors to quickfix window
5. Auto-opens error list if errors exist

**Compilation commands:**
| File type | Compiler |
|-----------|----------|
| `.c` | `gcc` |
| `.cpp` | `g++` |

> Executable is created as `{filename}.exe`

---

## 📁 LSP (clangd)

### Features
- Auto-starts for `.c` and `.cpp` files
- Background indexing (`--background-index`)
- `clang-tidy` support
- Root markers: `compile_commands.json`, `.git`

### Capabilities
| Function | Key |
|----------|-----|
| Go to definition | `gd` |
| Hover documentation | `K` |
| Rename symbol | `<leader>rn` |
| Find references | `gr` |

---

## 🐛 Debugging (DAP)

### Configuration
| Parameter | Value |
|-----------|-------|
| Adapter | `gdb` |
| Output format | `set print pretty on` |

### C configuration
```lua
name = "Launch"
type = "gdb"
request = "launch"
program = prompted at launch
cwd = "${workspaceFolder}"
```

### Debugger UI
- Open: `<leader> + du`
- Shows variables, breakpoints, call stack

---

## 🧩 Treesitter

### Installed parsers
| Language | Purpose |
|----------|---------|
| `c` | C syntax highlighting |
| `cpp` | C++ syntax highlighting |
| `make` | Makefile highlighting |

### Enabled features
- Syntax highlighting (`highlight = true`)
- Auto-indentation (`indent = true`)

---

## 📦 Requirements

| Program | Installation (Arch Linux) |
|---------|---------------------------|
| Neovim >= 0.9.0 | `sudo pacman -S neovim` |
| clangd | `sudo pacman -S clang` |
| gdb | `sudo pacman -S gdb` |
| gcc / g++ | `sudo pacman -S gcc` |
| clang-format | `sudo pacman -S clang` |
| git | `sudo pacman -S git` |

---

## 🔄 Installation & First Launch

1. Ensure all requirements are installed
2. Copy configuration to `~/.config/nvim/`
3. Launch Neovim:
   ```bash
   nvim
   ```
4. Plugins will auto-install via `lazy.nvim`
5. On first C/C++ file open, clangd may request additional setup

---

## 📁 Configuration Structure

| File | Purpose |
|------|---------|
| `init.lua` | Main config (all settings in one file) |
| `lazy-lock.json` | Plugin version locking |

---

## 💡 Notable Features

- **Transparency**: Neovim background is transparent — Kitty's blurred background shows through
- **Auto-compilation**: No need to manually type `gcc` commands
- **Quickfix**: Compilation errors shown in a convenient window
- **Built-in debugging**: GDB integration via DAP

---

## 🛠️ Potential Enhancements

- Add `clangd` support for `compile_commands.json` in larger projects
- Configure debugging with command-line arguments
- Add C/C++ snippets (LuaSnip)
- Enable auto-formatting on save
