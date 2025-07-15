local status, indent_blankline = pcall(require, "ibl")
if not status then
    return
end

indent_blankline.setup({
    indent = {
        char = "│",
        tab_char = "│",
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        injected_languages = false,
        highlight = { "Function", "Label" },
        priority = 500,
    },
    exclude = {
        filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
        },
    },
}) 