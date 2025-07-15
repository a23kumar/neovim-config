local status, bufferline = pcall(require, "bufferline")
if not status then
    return
end

bufferline.setup({
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
        themable = true,
        numbers = "none",
        close_command = "Bdelete! %d", -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
        indicator = {
            icon = "▎", -- this should be omitted if indicator style is not 'icon'
            style = "icon",
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 21,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
                return ""
            end
            
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
        separator_style = "slant",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {"close"},
        },
        sort_by = "insert_after_current",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true,
            },
        },
    },
    highlights = {
        separator = {
            fg = "#073642",
            bg = "#002b36",
        },
        separator_selected = {
            fg = "#073642",
        },
        background = {
            fg = "#657b83",
            bg = "#002b36",
        },
        buffer_selected = {
            fg = "#fdf6e3",
            bold = true,
        },
        fill = {
            bg = "#073642",
        },
    },
})

-- Keymaps for buffer navigation
local keymap = vim.keymap

-- Navigate buffers
keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- Move buffers
keymap.set("n", "<A-l>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
keymap.set("n", "<A-h>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })

-- Pick buffer
keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })

-- Close buffers
keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close all buffers to the left" })
keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", { desc = "Close all buffers to the right" })

-- Pin/unpin buffer
keymap.set("n", "<leader>bP", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin buffer" })

-- Sort buffers
keymap.set("n", "<leader>bs", "<cmd>BufferLineSortByExtension<CR>", { desc = "Sort buffers by extension" })
keymap.set("n", "<leader>bS", "<cmd>BufferLineSortByDirectory<CR>", { desc = "Sort buffers by directory" }) 