local status, project = pcall(require, "project_nvim")
if not status then
    return
end

project.setup({
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    ignore_lsp = {},
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = true,
    scope_chdir = 'global',
    datapath = vim.fn.stdpath("data"),
})

-- Integration with telescope
local telescope_status, telescope = pcall(require, "telescope")
if telescope_status then
    telescope.load_extension("projects")
end

-- Keymaps
local keymap = vim.keymap

keymap.set("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Find projects" }) 