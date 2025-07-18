# Neovim Configuration

My awesome and now complete neovim configs so I don't have to go through this pain again. 

## How to Use This Neovim Setup

This guide provides an overview of how to use my Neovim configurations, tailored to the installed plugins and scripts.

### Folder location
Place all this code in your nvim folder. You can create this dir in your .config folder that is located in your root dir (Atleast for MAC... atleast for what i know :| )
### The Leader Key

The "leader" key is a central concept in this configuration. It's a key that, when pressed, opens up a whole new set of shortcuts.

- **Your leader key is `Space`**.
- Any shortcut that starts with `<leader>` means "press the Space bar, then press the next key(s)". For example, `<leader>ff` means `Space` -> `f` -> `f`.

### Understanding Modes

Neovim is a modal editor. Here are the most common modes:

- **Normal Mode**: The default mode. Used for navigation, deleting, copying, pasting, and running commands. You can't type text directly here. Press `Esc` or `jk` to return to this mode.
- **Insert Mode**: Used for typing text. You can enter it from Normal mode by pressing `i` (insert before cursor), `a` (append after cursor), `o` (open new line below), or `O` (open new line above).
- **Visual Mode**: Used for selecting text. Enter it from Normal mode by pressing `v` (character-wise), `V` (line-wise), or `Ctrl-v` (block-wise).
- **Command Mode**: Used for running commands. Enter it from Normal mode by pressing `:`.

### Plugin Management

This setup uses **Packer** to manage plugins.

- **Plugin List**: The list of plugins is in `lua/a23kumar/plugin-setup.lua`.
- **Syncing Plugins**: After changing the plugin list, you must run `:PackerSync` in Neovim to install, update, or remove plugins.

---

## Keymaps & Shortcuts

This section details all the keybindings, from core Neovim commands to plugin-specific shortcuts.

### Core Neovim Commands

These are some of the most fundamental commands for editing.

| Key(s) | Mode | Description |
|---|---|---|
| `h`, `j`, `k`, `l` | Normal | Move left, down, up, right |
| `w`, `b`, `e` | Normal | Move by words (forward, backward, end) |
| `0`, `^`, `$` | Normal | Move to start of line, first non-whitespace, end of line |
| `gg`, `G` | Normal | Go to the beginning, end of the file |
| `yy`, `dd`, `p` | Normal | Yank (copy) a line, delete a line, paste after cursor |
| `y`, `d`, `c` | Normal | Yank, delete, or change, followed by a motion (e.g., `dw` to delete a word) |
| `u`, `Ctrl-r` | Normal | Undo, Redo |
| `:w`, `:q`, `:wq` | Normal | Save file, quit, save and quit |

### General Custom Keymaps

These are custom, general-purpose shortcuts defined in `lua/a23kumar/core/keymaps.lua`.

| Keymap | Mode | Description |
|---|---|---|
| `jk` | Insert | A quick way to exit Insert Mode (instead of `Esc`) |
| `<leader>nh` | Normal | Clears the search highlight |
| `x` | Normal | Deletes the character under the cursor without copying it |
| `<leader>+` | Normal | Increments the number under the cursor |
| `<leader>-` | Normal | Decrements the number under the cursor |

### Window & Tab Management

| Keymap | Mode | Description |
|---|---|---|
| `<leader>sv` | Normal | Split window vertically |
| `<leader>sh` | Normal | Split window horizontally |
| `<leader>se` | Normal | Make all split windows equal in size |
| `<leader>sx` | Normal | Close the current split window |
| `<leader>to` | Normal | Open a new tab |
| `<leader>tx` | Normal | Close the current tab |
| `<leader>tn` | Normal | Go to the next tab |
| `<leader>tp` | Normal | Go to the previous tab |
| `<leader>tf` | Normal | Open the current file in a new tab |

### Plugin-Specific Keymaps

#### NvimTree (File Explorer)

| Keymap | Mode | Description |
|---|---|---|
| `<leader>e` | Normal | Toggle the NvimTree file explorer |
| `<leader>ef` | Normal | Find and focus the current file in the explorer |
| `<leader>ec` | Normal | Collapse all folders in the explorer |
| `<leader>er` | Normal | Refresh the explorer |

**Within NvimTree:**
- `<CR>` (Enter): Open file in current window/buffer
- `<C-t>`: Open file in new tab

**Auto-opening Behavior:**
- File explorer automatically opens when you start Neovim with `nvim` (no file arguments)
- File explorer automatically opens in new tabs (`<leader>to`)
- Explorer syncs with current working directory and shows current file location

#### Bufferline (VS Code-like Tabs)

Navigate and manage your open files with a beautiful tab bar at the top.

| Keymap | Mode | Description |
|---|---|---|
| `<S-h>` | Normal | Go to previous buffer |
| `<S-l>` | Normal | Go to next buffer |
| `<A-h>` | Normal | Move current buffer left |
| `<A-l>` | Normal | Move current buffer right |
| `<leader>bp` | Normal | Pick buffer (interactive selection) |
| `<leader>bc` | Normal | Pick buffer to close |
| `<leader>bh` | Normal | Close all buffers to the left |
| `<leader>bl` | Normal | Close all buffers to the right |
| `<leader>bP` | Normal | Toggle pin buffer |
| `<leader>bs` | Normal | Sort buffers by extension |
| `<leader>bS` | Normal | Sort buffers by directory |

#### Neoscroll (Smooth Scrolling)

Navigate through files with smooth, animated scrolling instead of instant jumps.

| Keymap | Mode | Description |
|---|---|---|
| `<C-u>` | Normal | Scroll UP half a page (smooth animation) |
| `<C-d>` | Normal | Scroll DOWN half a page (smooth animation) |
| `<C-b>` | Normal | Scroll UP one full page (smooth animation) |
| `<C-f>` | Normal | Scroll DOWN one full page (smooth animation) |
| `<C-y>` | Normal | Scroll UP one line (precise navigation) |
| `<C-e>` | Normal | Scroll DOWN one line (precise navigation) |
| `zt` | Normal | Move current line to TOP of screen |
| `zz` | Normal | Move current line to CENTER of screen |
| `zb` | Normal | Move current line to BOTTOM of screen |

**Animation Details:**
- Half-page scrolling (`<C-u>/<C-d>`): 250ms with sine easing
- Full-page scrolling (`<C-b>/<C-f>`): 450ms with circular easing  
- Line-by-line scrolling (`<C-y>/<C-e>`): 100ms with constant speed
- Cursor positioning (`zt/zz/zb`): 250ms smooth transition

#### Avante AI Assistant (Cursor-like IDE)

AI-powered code assistance that provides intelligent suggestions and allows you to apply changes directly to your code.

**🔐 API Key Setup:**

Before using Avante, you need to set up an API key for your chosen provider:

**For OpenAI (default):**
```bash
export OPENAI_API_KEY="your-openai-api-key-here"
# Or use scoped key (recommended):
export AVANTE_OPENAI_API_KEY="your-openai-api-key-here"
```

**For Claude:**
```bash
export ANTHROPIC_API_KEY="your-claude-api-key-here"
# Or use scoped key (recommended):
export AVANTE_ANTHROPIC_API_KEY="your-claude-api-key-here"
```

**For Gemini:**
```bash
export GEMINI_API_KEY="your-gemini-api-key-here"
# Or use scoped key (recommended):
export AVANTE_GEMINI_API_KEY="your-gemini-api-key-here"
```

Add these to your shell profile (`~/.zshrc`, `~/.bashrc`, etc.) and restart your terminal or run `source ~/.zshrc`.

**Main Commands:**

| Keymap | Mode | Description |
|---|---|---|
| `<leader>aa` | Normal/Visual | Ask AI for code suggestions |
| `<leader>at` | Normal | Toggle AI panel |
| `<leader>ar` | Normal | Refresh AI windows |
| `<leader>af` | Normal | Switch focus windows |
| `<leader>ae` | Normal/Visual | Edit selected block with AI |
| `<leader>an` | Normal | Chat with the codebase |
| `<leader>aN` | Normal | Create new chat |
| `<leader>ah` | Normal | Show chat histories |
| `<leader>as` | Normal | Switch AI provider |
| `<leader>aS` | Normal | Stop current AI request |
| `<leader>am` | Normal | Show available models |
| `<leader>ac` | Normal | Clear history |
| `<leader>ab` | Normal | Build Avante dependencies |

**Within AI Sidebar:**

| Keymap | Mode | Description |
|---|---|---|
| `A` | Normal | Apply all AI suggestions |
| `a` | Normal | Apply suggestion at cursor |
| `r` | Normal | Retry user request |
| `e` | Normal | Edit user request |
| `<Tab>` | Normal | Switch between windows |
| `<S-Tab>` | Normal | Reverse switch windows |
| `d` | Normal | Remove file from context |
| `@` | Normal | Add file to context |
| `q` / `<Esc>` | Normal | Close sidebar |
| `<CR>` | Normal | Submit query |
| `<C-s>` | Insert | Submit query |

**Diff/Conflict Resolution:**

| Keymap | Mode | Description |
|---|---|---|
| `co` | Normal | Choose our version (current code) |
| `ct` | Normal | Choose their version (AI suggestion) |
| `ca` | Normal | Choose all AI suggestions |
| `cb` | Normal | Choose both versions |
| `cc` | Normal | Choose version at cursor |
| `]x` | Normal | Move to next conflict |
| `[x` | Normal | Move to previous conflict |

**AI Suggestions:**

| Keymap | Mode | Description |
|---|---|---|
| `<M-l>` | Normal | Accept AI suggestion |
| `<M-]>` | Normal | Next suggestion |
| `<M-[>` | Normal | Previous suggestion |
| `<C-]>` | Normal | Dismiss suggestion |

**@Mentions (for context):**
- `@file` - Include current file
- `@codebase` - Include entire codebase
- `@diagnostics` - Include diagnostic issues
- `@quickfix` - Include quickfix list
- `@buffers` - Include all open buffers

#### Buffer Management (Bbye)

| Keymap | Mode | Description |
|---|---|---|
| `<leader>bd` | Normal | Delete current buffer (without closing window) |
| `<leader>bD` | Normal | Force delete current buffer |
| `<leader>bo` | Normal | Delete all buffers except current |

#### Telescope (Fuzzy Finder)

| Keymap | Mode | Description |
|---|---|---|
| `<leader>ff` | Normal | Find files in the current directory |
| `<leader>fr` | Normal | Find recent files |
| `<leader>fs` | Normal | Live grep for a string in the current directory |
| `<leader>fc` | Normal | Grep for the string under the cursor |
| `<leader>fb` | Normal | List and switch between open buffers |
| `<leader>fh` | Normal | Search help tags |
| `<leader>fd` | Normal | Show project-wide diagnostics (errors, warnings) |
| `<leader>fg` | Normal | Find files tracked by Git |
| `<leader>fm` | Normal | Show marks |
| `<leader>fo` | Normal | Show document symbols (functions, variables) |
| `<leader>fw` | Normal | Show workspace symbols |
| `<leader>fk` | Normal | Show available keymaps |
| `<leader>fC` | Normal | Show available commands |
| `<leader>fp` | Normal | Find and switch between projects |

#### Gitsigns (Git Integration)

| Keymap | Mode | Description |
|---|---|---|
| `]c` | Normal | Jump to the next git hunk (change) |
| `[c` | Normal | Jump to the previous git hunk |
| `<leader>hs` | Normal/Visual | Stage the selected hunk |
| `<leader>hr` | Normal/Visual | Reset (revert) the selected hunk |
| `<leader>hS` | Normal | Stage the entire buffer |
| `<leader>hu` | Normal | Undo the last staged hunk |
| `<leader>hR` | Normal | Reset the entire buffer |
| `<leader>hp` | Normal | Preview the hunk's changes |
| `<leader>hb` | Normal | Show blame information for the current line |
| `<leader>tb` | Normal | Toggle the inline blame display |
| `<leader>hd` | Normal | Diff the buffer against the git index |
| `<leader>td` | Normal | Toggle deleted lines display |
| `ih` | Operator/Visual | Text object for the current hunk |

#### DAP (Debugger)

| Keymap | Mode | Description |
|---|---|---|
| `<leader>db` | Normal | Toggle a breakpoint on the current line |
| `<leader>dc` | Normal | Continue the debugging session |
| `<leader>di` | Normal | Step into the current function call |
| `<leader>do` | Normal | Step over the current line |
| `<leader>du` | Normal | Step out of the current function |
| `<leader>dr` | Normal | Toggle the debug REPL |
| `<leader>dl` | Normal | Run the last debugging configuration |
| `<leader>dt` | Normal | Toggle the DAP UI |

#### Toggleterm (Terminal Manager)

| Keymap | Mode | Description |
|---|---|---|
| `<c-\>` | Normal | Toggle a floating terminal |
| `<leader>Tf` | Normal | Toggle a floating terminal |
| `<leader>Th` | Normal | Toggle a horizontal terminal at the bottom |
| `<leader>Tv` | Normal | Toggle a vertical terminal on the right |
| `<leader>gg` | Normal | Toggle a floating `lazygit` session |
| `<leader>Tn` | Normal | Toggle a floating `node` REPL |
| `<leader>Tu` | Normal | Toggle a floating `ncdu` (disk usage) session |
| `<leader>Tt` | Normal | Toggle a floating `htop` (process viewer) session |
| `<leader>Tp` | Normal | Toggle a floating `python` REPL |

#### Spectre (Search & Replace)

| Keymap | Mode | Description |
|---|---|---|
| `<leader>S` | Normal | Toggle the Spectre search and replace panel |
| `<leader>sw` | Normal/Visual | Search for the current word/selection |
| `<leader>sp` | Normal | Search within the current file |

#### Flash (Enhanced Navigation)

| Keymap | Mode | Description |
|---|---|---|
| `s` | Normal, Visual, Operator | Jump to any location on screen |
| `S` | Normal, Visual, Operator | Jump to any location using Treesitter nodes |
| `r` | Operator | Remote flash (for multi-window operations) |
| `R` | Operator, Visual | Treesitter search |
| `<c-s>` | Command | Toggle flash search |

#### Miscellaneous Plugins

| Keymap | Mode | Plugin | Description |
|---|---|---|---|
| `<leader>ss` | Normal | Auto Session | Save the current session |
| `<leader>sr` | Normal | Auto Session | Restore the last session |
| `<leader>sd` | Normal | Auto Session | Delete a session |
| `<leader>nd` | Normal | Notify | Dismiss all notifications |

## Plugin Overview

Here is a list of all the plugins used in this configuration and what they do.

- **[packer.nvim](https://github.com/wbthomason/packer.nvim)**: A plugin manager for Neovim.
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)**: A library of useful Lua functions that other plugins depend on.
- **[vim-nightfly-guicolors](https://github.com/bluz71/vim-nightfly-guicolors)**: The chosen color scheme.
- **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)**: For seamless navigation between tmux and Neovim splits.
- **[vim-maximizer](https://github.com/szw/vim-maximizer)**: Maximizes and restores the current window.
- **[vim-surround](https://github.com/tpope/vim-surround)**: For easily adding, changing, and deleting "surroundings" like quotes, brackets, and tags.
- **[ReplaceWithRegister](https://github.com/vim-scripts/ReplaceWithRegister)**: Replaces text with the contents of a register.
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Smart and context-aware commenting (`gc`).
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: A file explorer sidebar.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A fast and customizable statusline.
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)**: Provides VS Code-like tabs at the top for buffer management.
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: A highly extendable fuzzy finder for files, buffers, git, LSP, and more.
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Configurations for the Neovim Language Server Protocol (LSP) client.
- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: Manages LSP servers, DAP servers, linters, and formatters.
- **[none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)**: Integrates formatters and linters that are not LSP-based.
- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)**: A Debug Adapter Protocol client for step-through debugging.
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: An advanced autocompletion plugin.
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: A powerful snippet engine.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Provides advanced syntax highlighting, indentation, and text objects.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Adds git decorations to the sign column and provides hunk manipulation commands.
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Automatically closes pairs of brackets, quotes, etc.
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)**: Adds indentation guides.
- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)**: A terminal manager for easily toggling terminals.
- **[nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)**: Enhances the quickfix window with previews and filtering.
- **[nvim-spectre](https://github.com/nvim-pack/nvim-spectre)**: A powerful project-wide search and replace tool.
- **[vim-bbye](https://github.com/moll/vim-bbye)**: A better way to close buffers without messing up your window layout.
- **[auto-session](https://github.com/rmagatti/auto-session)**: Automatically saves and restores your work sessions.
- **[project.nvim](https://github.com/ahmedkhalf/project.nvim)**: A project management plugin for easy switching between projects.
- **[nvim-notify](https://github.com/rcarriga/nvim-notify)**: A prettier notification manager.
- **[dressing.nvim](https://github.com/stevearc/dressing.nvim)**: Provides a better UI for `vim.ui.input` and `vim.ui.select`.
- **[flash.nvim](https://github.com/folke/flash.nvim)**: Enhances search and navigation by highlighting all matches on screen.
- **[neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)**: Provides smooth scrolling animations instead of instant jumps for better navigation experience.
- **[avante.nvim](https://github.com/yetone/avante.nvim)**: AI-powered code assistance plugin that emulates Cursor AI IDE behavior with intelligent suggestions and code modifications.
- **[dressing.nvim](https://github.com/stevearc/dressing.nvim)**: Provides a better UI for `vim.ui.input` and `vim.ui.select` (used by Avante for enhanced input).
