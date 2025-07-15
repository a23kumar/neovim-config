local status, auto_session = pcall(require, "auto-session")
if not status then
    return
end

auto_session.setup({
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    auto_session_use_git_branch = false,
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = nil,
    auto_restore_enabled = nil,
    auto_session_create_enabled = nil,
})

-- Keymaps
local keymap = vim.keymap

keymap.set("n", "<leader>ss", "<cmd>SaveSession<CR>", { desc = "Save session" })
keymap.set("n", "<leader>sr", "<cmd>RestoreSession<CR>", { desc = "Restore session" })
keymap.set("n", "<leader>sd", "<cmd>DeleteSession<CR>", { desc = "Delete session" }) 