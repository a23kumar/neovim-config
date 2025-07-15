local keymap = vim.keymap

keymap.set("n", "<leader>aa", function() require("avante").ask() end, { desc = "Ask AI for code suggestions" })
keymap.set("v", "<leader>aa", function() require("avante").ask() end, { desc = "Ask AI for code suggestions" })
keymap.set("n", "<leader>at", function() require("avante").toggle() end, { desc = "Toggle AI panel" })
keymap.set("n", "<leader>ar", function() require("avante").refresh() end, { desc = "Refresh AI windows" })
keymap.set("n", "<leader>af", function() require("avante").focus() end, { desc = "Switch focus windows" })
keymap.set("n", "<leader>ae", function() require("avante").edit() end, { desc = "Edit selected block with AI" })
keymap.set("v", "<leader>ae", function() require("avante").edit() end, { desc = "Edit selected block with AI" })

-- Additional commands
keymap.set("n", "<leader>an", function() require("avante").chat() end, { desc = "Chat with the codebase" })
keymap.set("n", "<leader>aN", function() require("avante").chat_new() end, { desc = "Create new chat" })
keymap.set("n", "<leader>ah", function() require("avante").history() end, { desc = "Show chat histories" })
keymap.set("n", "<leader>as", function() require("avante").switch_provider() end, { desc = "Switch AI provider" })
keymap.set("n", "<leader>aS", function() require("avante").stop() end, { desc = "Stop current AI request" })
keymap.set("n", "<leader>am", function() require("avante").models() end, { desc = "Show available models" })
keymap.set("n", "<leader>ac", function() require("avante").clear() end, { desc = "Clear history" })
keymap.set("n", "<leader>ab", function() require("avante").build() end, { desc = "Build Avante dependencies" })
