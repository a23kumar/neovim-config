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
        left_mouse_command = function(bufnr)
            -- Function to open buffer in main window, not terminal
            local current_win = vim.api.nvim_get_current_win()
            local current_buf = vim.api.nvim_win_get_buf(current_win)
            local current_filetype = vim.api.nvim_buf_get_option(current_buf, 'filetype')
            
            -- If current window is a terminal, find the main editing window
            if current_filetype == 'toggleterm' then
                -- Look for a non-terminal window
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local win_buf = vim.api.nvim_win_get_buf(win)
                    local win_filetype = vim.api.nvim_buf_get_option(win_buf, 'filetype')
                    if win_filetype ~= 'toggleterm' and win_filetype ~= 'NvimTree' then
                        vim.api.nvim_set_current_win(win)
                        break
                    end
                end
            end
            
            -- Switch to the buffer
            vim.api.nvim_set_current_buf(bufnr)
        end,
        middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
        indicator = {
            icon = "▎", -- this should be omitted if indicator style is not 'icon'
            style = "icon",
        },
        buffer_close_icon = "x",
        modified_icon = "●",
        close_icon = "X",
        left_trunc_marker = "<",
        right_trunc_marker = ">",
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

-- Helper function to switch to main editing window if in terminal
local function smart_buffer_switch(direction)
    local current_win = vim.api.nvim_get_current_win()
    local current_buf = vim.api.nvim_win_get_buf(current_win)
    local current_filetype = vim.api.nvim_buf_get_option(current_buf, 'filetype')
    
    -- If current window is a terminal, find the main editing window
    if current_filetype == 'toggleterm' then
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local win_buf = vim.api.nvim_win_get_buf(win)
            local win_filetype = vim.api.nvim_buf_get_option(win_buf, 'filetype')
            if win_filetype ~= 'toggleterm' and win_filetype ~= 'NvimTree' then
                vim.api.nvim_set_current_win(win)
                break
            end
        end
    end
    
    -- Execute the buffer navigation command
    if direction == "next" then
        vim.cmd("BufferLineCycleNext")
    else
        vim.cmd("BufferLineCyclePrev")
    end
end

-- Navigate buffers with smart terminal handling
keymap.set("n", "<S-l>", function() smart_buffer_switch("next") end, { desc = "Next buffer" })
keymap.set("n", "<S-h>", function() smart_buffer_switch("prev") end, { desc = "Previous buffer" })

-- macOS-style buffer navigation (Option+Cmd+Arrow)
keymap.set("n", "<D-A-Right>", function() smart_buffer_switch("next") end, { desc = "Next buffer (macOS style)" })
keymap.set("n", "<D-A-Left>", function() smart_buffer_switch("prev") end, { desc = "Previous buffer (macOS style)" })

-- Alternative mappings in case the above don't work in your terminal
keymap.set("n", "<M-D-Right>", function() smart_buffer_switch("next") end, { desc = "Next buffer (alt mapping)" })
keymap.set("n", "<M-D-Left>", function() smart_buffer_switch("prev") end, { desc = "Previous buffer (alt mapping)" })

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

-- Insert mode buffer navigation (Option+Cmd+Arrow)
keymap.set("i", "<D-A-Right>", function() 
    vim.cmd("stopinsert")
    smart_buffer_switch("next")
    vim.cmd("startinsert")
end, { desc = "Next buffer from insert mode" })
keymap.set("i", "<D-A-Left>", function() 
    vim.cmd("stopinsert")
    smart_buffer_switch("prev")
    vim.cmd("startinsert")
end, { desc = "Previous buffer from insert mode" })
keymap.set("i", "<M-D-Right>", function() 
    vim.cmd("stopinsert")
    smart_buffer_switch("next")
    vim.cmd("startinsert")
end, { desc = "Next buffer from insert mode (alt)" })
keymap.set("i", "<M-D-Left>", function() 
    vim.cmd("stopinsert")
    smart_buffer_switch("prev")
    vim.cmd("startinsert")
end, { desc = "Previous buffer from insert mode (alt)" }) 