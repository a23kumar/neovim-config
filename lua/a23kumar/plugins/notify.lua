local status, notify = pcall(require, "notify")
if not status then
    return
end

notify.setup({
    background_colour = "NotifyBackground",
    fps = 30,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "fade_in_slide_out",
    timeout = 5000,
    top_down = true
})

-- Set as default notification handler
vim.notify = notify

-- Keymaps
local keymap = vim.keymap

keymap.set("n", "<leader>nd", "<cmd>lua require('notify').dismiss()<CR>", { desc = "Dismiss notifications" }) 