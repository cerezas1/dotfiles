# Neovim Configuration

A personal Neovim configuration focused on a fast, minimal and keyboard-driven development workflow.

The configuration is built around [`lazy.nvim`](https://github.com/folke/lazy.nvim) and keeps the setup modular by separating core settings from individual plugins.

## ✨ Features

* ⚡ Fast plugin management with `lazy.nvim`
* 🧠 LSP support with Mason
* ✍️ Autocompletion with `nvim-cmp`
* 🌳 Syntax highlighting with Treesitter
* 🔎 Fuzzy finding with Telescope
* 📁 File management with Oil
* 🔀 Git integration with Gitsigns
* ⌨️ Keymap discovery with which-key
* 🎨 Catppuccin Mocha theme
* 🧩 Modular plugin configuration
* 🔒 Reproducible plugin versions through `lazy-lock.json`

---

## Requirements

The configuration expects the following system dependencies:

* Neovim 0.10+
* Git
* ripgrep (`rg`)
* A C compiler (`gcc` or `clang`)
* A Nerd Font

You can verify your Neovim installation with:

```bash
nvim --version
```

After installation, run:

```vim
:checkhealth
```

This is the easiest way to identify missing dependencies or configuration problems.

---

## 🚀 Installation

### 1. Back up your existing configuration

If you already have a Neovim configuration, create a backup first:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

### 2. Clone the dotfiles repository

```bash
git clone https://github.com/cerezas1/dotfiles.git ~/dotfiles
```

### 3. Install the Neovim configuration

Copy the configuration into the expected Neovim directory:

```bash
cp -r ~/dotfiles/config/nvim ~/.config/nvim
```

Alternatively, if you manage your dotfiles with symlinks, you can link the directory instead:

```bash
ln -s ~/dotfiles/config/nvim ~/.config/nvim
```

> Make sure `~/.config/nvim` does not already exist before creating the symlink.

### 4. Start Neovim

```bash
nvim
```

On the first launch, `lazy.nvim` bootstraps itself and installs the plugins defined under `lua/plugins/`.

Once installation finishes, restart Neovim.

Finally, run:

```vim
:checkhealth
```

---

## 📁 Structure

```text
nvim/
├── init.lua
├── lazy-lock.json
├── README.md
│
└── lua/
    ├── core/
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── lazy.lua
    │
    └── plugins/
        ├── colorscheme.lua
        ├── treesitter.lua
        ├── telescope.lua
        ├── lsp.lua
        ├── cmp.lua
        ├── mini.lua
        ├── gitsigns.lua
        ├── which-key.lua
        └── oil.lua
```

### Core

The `lua/core/` directory contains configuration that is not tied to a specific plugin.

| File          | Purpose                              |
| ------------- | ------------------------------------ |
| `options.lua` | General Neovim options               |
| `keymaps.lua` | Global keymaps                       |
| `lazy.lua`    | Bootstrap and initialize `lazy.nvim` |

`init.lua` is intentionally small and acts as the entry point for the configuration.

### Plugins

Every file inside `lua/plugins/` defines an independent plugin or plugin group.

| File              | Purpose                               |
| ----------------- | ------------------------------------- |
| `colorscheme.lua` | Catppuccin theme and color overrides  |
| `treesitter.lua`  | Syntax parsing and highlighting       |
| `telescope.lua`   | Fuzzy finder                          |
| `lsp.lua`         | LSP servers and Mason                 |
| `cmp.lua`         | Autocompletion                        |
| `mini.lua`        | Statusline, autopairs and indentation |
| `gitsigns.lua`    | Git indicators                        |
| `which-key.lua`   | Keymap discovery                      |
| `oil.lua`         | File explorer                         |

This structure makes it easy to add, remove or modify plugins without changing the rest of the configuration.

---

## 🔌 Plugins

The main plugins currently used by this configuration are:

* [`lazy.nvim`](https://github.com/folke/lazy.nvim) — plugin manager
* [`catppuccin`](https://github.com/catppuccin/nvim) — colorscheme
* [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) — syntax parsing
* [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) — fuzzy finder
* [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) — LSP configuration
* [`mason.nvim`](https://github.com/mason-org/mason.nvim) — external tool/package management
* [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) — completion engine
* [`mini.nvim`](https://github.com/echasnovski/mini.nvim) — small independent utilities
* [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim) — Git integration
* [`which-key.nvim`](https://github.com/folke/which-key.nvim) — keymap helper
* [`oil.nvim`](https://github.com/stevearc/oil.nvim) — file explorer

Plugin versions are tracked in `lazy-lock.json` to keep the environment reproducible.

---

## ⌨️ Keymaps

The leader key is mapped to **Space**.

### Navigation

| Keymap       | Action                            |
| ------------ | --------------------------------- |
| `<leader>ff` | Find files                        |
| `<leader>fg` | Search text across the project    |
| `<leader>fb` | Find open buffers                 |
| `-`          | Open Oil in the current directory |

### LSP

| Keymap       | Action                    |
| ------------ | ------------------------- |
| `gd`         | Go to definition          |
| `K`          | Show symbol documentation |
| `<leader>rn` | Rename symbol             |
| `<leader>ca` | Code actions              |

These mappings require an active LSP server for the current buffer.

### Editing

| Keymap      | Action                             |
| ----------- | ---------------------------------- |
| `gcc`       | Comment/uncomment the current line |
| `<leader>w` | Save                               |
| `<leader>q` | Close the current window           |

### Discovering keymaps

Press:

```text
<Space>
```

and wait briefly.

`which-key` will display the available mappings and help discover commands without having to memorize everything.

---

## 🧠 LSP & Autocompletion

Language servers are managed through Mason and configured in:

```text
lua/plugins/lsp.lua
```

Autocompletion is handled separately through:

```text
lua/plugins/cmp.lua
```

This separation keeps language-server configuration independent from the completion UI.

### Adding a language

To add another language server:

1. Open:

```text
lua/plugins/lsp.lua
```

2. Add the server to `ensure_installed`.

For example:

```lua
ensure_installed = {
    "lua_ls",
    "pyright",
}
```

3. If the server requires custom configuration, add its setup block alongside the existing LSP configuration.

4. Optionally add the corresponding Treesitter parser in:

```text
lua/plugins/treesitter.lua
```

After restarting Neovim, Mason should install the new server automatically.

You can inspect installed language servers with:

```vim
:Mason
```

---

## 🌳 Treesitter

Treesitter provides syntax parsing and highlighting.

The configuration is located at:

```text
lua/plugins/treesitter.lua
```

A C compiler such as `gcc` or `clang` is required because Treesitter parsers may need to be compiled locally.

---

## 🔎 Telescope

Telescope provides fuzzy searching throughout the editor.

The most commonly used mappings are:

```text
<leader>ff   Find files
<leader>fg   Live grep
<leader>fb   Find buffers
```

`ripgrep` is required for project-wide text searches with `live_grep`.

---

## 📁 Oil

Oil is used as the file explorer.

Open it with:

```text
-
```

This keeps file management inside the editor while preserving a minimal interface.

---

## 🎨 Theme

The configuration uses **Catppuccin Mocha** with custom color overrides to keep Neovim visually consistent with the rest of the desktop setup.

The main colors are:

| Color | Value     | Usage                    |
| ----- | --------- | ------------------------ |
| Base  | `#1e1e2e` | Main background          |
| Mauve | `#cba6f7` | Primary accent           |
| Pink  | `#f5c2e7` | Secondary accent         |
| Crust | `#110f18` | Dark background override |

Theme customization lives in:

```text
lua/plugins/colorscheme.lua
```

If the rest of the desktop rice changes, this is the main file that needs to be updated to keep the colors synchronized.

---

## 🧩 Adding a Plugin

Plugins are intentionally kept as separate files inside:

```text
lua/plugins/
```

For example:

```text
lua/plugins/example.lua
```

A minimal plugin specification looks like:

```lua
return {
    "author/plugin-name",
}
```

With options:

```lua
return {
    "author/plugin-name",
    opts = {
        -- plugin configuration
    },
}
```

`lazy.nvim` automatically discovers plugin specifications inside `lua/plugins/`.

After restarting Neovim, the plugin will be installed and loaded according to its configuration.

---

## 🔧 Troubleshooting

If something does not work after installation, start with:

```vim
:checkhealth
```

Then check:

```vim
:Lazy
```

for plugin installation or loading problems.

For LSP-related issues:

```vim
:Mason
```

and verify that the required language server is installed.

For Treesitter issues, make sure a C compiler is available:

```bash
gcc --version
```

or:

```bash
clang --version
```

For Telescope's `live_grep`, verify that ripgrep is installed:

```bash
rg --version
```

---

## 🔒 Reproducibility

The repository includes `lazy-lock.json`, which records the exact commit currently used for each plugin.

When changing plugins, keep the lockfile committed so that the configuration can be reproduced consistently across machines.

---
