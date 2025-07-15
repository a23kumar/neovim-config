local status, telescope = pcall(require, "telescope")
if not status then
    return
end

local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        path_display = { "truncate" },
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist,
            },
        },
    },
})

-- Keymaps
local keymap = vim.keymap

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Show open buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Show help tags" })
keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Show diagnostics" })
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Find git files" })
keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Show marks" })
keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Show document symbols" })
keymap.set("n", "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Show workspace symbols" })
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Show keymaps" })
keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Show commands" })
