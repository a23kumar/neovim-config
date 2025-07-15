-- Better buffer deletion
local keymap = vim.keymap

-- Delete buffer without closing window
keymap.set("n", "<leader>bd", "<cmd>Bdelete<CR>", { desc = "Delete buffer" })
keymap.set("n", "<leader>bD", "<cmd>Bdelete!<CR>", { desc = "Force delete buffer" })

-- Delete all buffers except current
keymap.set("n", "<leader>bo", "<cmd>%bd|e#<CR>", { desc = "Delete all buffers except current" }) 