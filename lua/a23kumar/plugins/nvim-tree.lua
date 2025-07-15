local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  view = {
    width = 35,
    relativenumber = true,
    signcolumn = "yes",
    side = "left",
    preserve_window_proportions = true,
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = "name",
    root_folder_label = ":~",
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "@",
        folder = {
          arrow_closed = ">",
          arrow_open = "v",
          default = "D",
          open = "O",
          empty = "E",
          empty_open = "e",
          symlink = "L",
          symlink_open = "l",
        },
        git = {
          unstaged = "M",
          staged = "S",
          unmerged = "U",
          renamed = "R",
          untracked = "?",
          deleted = "D",
          ignored = "I",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = { ".DS_Store", "thumbs.db" },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = false,
      },
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
})

-- Remap <CR> (Enter) in NvimTree to open files in current window/buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    local api = require("nvim-tree.api")
    
    -- Open file in current window (creates new buffer)
    vim.keymap.set("n", "<CR>", api.node.open.edit, { buffer = true, desc = "Open file" })
    
    -- Optional: Keep tab functionality for those who want it
    vim.keymap.set("n", "<C-t>", api.node.open.tab, { buffer = true, desc = "Open in new tab" })
  end,
})

-- Optional: Keybinds (can remove if already defined elsewhere)
local keymap = vim.keymap
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Focus Current File in Explorer" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse All Explorer Folders" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh Explorer" })

-- Auto-open NvimTree when starting Neovim
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open NvimTree automatically when starting Neovim",
  callback = function()
    -- Only open if no file was specified as argument and we're not in a git commit or similar
    if vim.fn.argc() == 0 and not vim.env.GIT_AUTHOR_DATE then
      vim.schedule(function()
        vim.cmd("NvimTreeOpen")
        -- Focus back to the main window
        vim.cmd("wincmd l")
      end)
    end
  end,
})

-- Auto-open NvimTree when creating new tabs
vim.api.nvim_create_autocmd("TabNewEntered", {
  desc = "Open NvimTree automatically in new tabs",
  callback = function()
    vim.schedule(function()
      vim.cmd("NvimTreeOpen")
      -- Focus back to the main window
      vim.cmd("wincmd l")
    end)
  end,
})


