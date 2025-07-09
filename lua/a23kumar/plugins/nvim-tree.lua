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
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
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
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})

-- Optional: Keybinds (can remove if already defined elsewhere)
local keymap = vim.keymap
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Focus Current File in Explorer" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse All Explorer Folders" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh Explorer" })


