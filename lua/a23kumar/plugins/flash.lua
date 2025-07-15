local status, flash = pcall(require, "flash")
if not status then
    return
end

flash.setup({
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
        multi_window = true,
        forward = true,
        wrap = true,
        mode = "exact",
        incremental = false,
        exclude = {
            "notify",
            "cmp_menu",
            "noice",
            "flash_prompt",
            function(win)
                return not vim.api.nvim_win_get_config(win).focusable
            end,
        },
        trigger = "",
        max_length = false,
    },
    jump = {
        jumplist = true,
        pos = "start",
        history = false,
        register = false,
        nohlsearch = false,
        autojump = false,
    },
    label = {
        uppercase = true,
        exclude = "",
        current = true,
        after = true,
        before = false,
        style = "overlay",
        reuse = "lowercase",
        distance = true,
        min_pattern_length = 0,
        rainbow = {
            enabled = false,
            shade = 5,
        },
        format = function(opts)
            return { { opts.match.label, opts.hl_group } }
        end,
    },
    highlight = {
        backdrop = true,
        matches = true,
        priority = 5000,
        groups = {
            match = "FlashMatch",
            current = "FlashCurrent",
            backdrop = "FlashBackdrop",
            label = "FlashLabel",
        },
    },
    action = nil,
    pattern = "",
    continue = false,
    config = nil,
    prompt = {
        enabled = true,
        prefix = { { "⚡", "FlashPromptIcon" } },
        win_config = {
            relative = "editor",
            width = 1,
            height = 1,
            row = -1,
            col = 0,
            zindex = 1000,
        },
    },
    remote_op = {
        restore = false,
        motion = false,
    },
})

-- Keymaps
local keymap = vim.keymap

keymap.set({ "n", "x", "o" }, "s", function()
    flash.jump()
end, { desc = "Flash" })

keymap.set({ "n", "x", "o" }, "S", function()
    flash.treesitter()
end, { desc = "Flash Treesitter" })

keymap.set("o", "r", function()
    flash.remote()
end, { desc = "Remote Flash" })

keymap.set({ "o", "x" }, "R", function()
    flash.treesitter_search()
end, { desc = "Treesitter Search" })

keymap.set("c", "<c-s>", function()
    flash.toggle()
end, { desc = "Toggle Flash Search" }) 