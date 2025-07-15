local status, gitsigns = pcall(require, "gitsigns")
if not status then
    return
end

gitsigns.setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local keymap = vim.keymap

        -- Navigation
        keymap.set("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Next git hunk" })

        keymap.set("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Previous git hunk" })

        -- Actions
        keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
        keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
        keymap.set("v", "<leader>hs", function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, { buffer = bufnr, desc = "Stage hunk" })
        keymap.set("v", "<leader>hr", function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, { buffer = bufnr, desc = "Reset hunk" })
        keymap.set("n", "<leader>hS", gs.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
        keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
        keymap.set("n", "<leader>hR", gs.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
        keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
        keymap.set("n", "<leader>hb", function() gs.blame_line{full=true} end, { buffer = bufnr, desc = "Blame line" })
        keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle line blame" })
        keymap.set("n", "<leader>hd", gs.diffthis, { buffer = bufnr, desc = "Diff this" })
        keymap.set("n", "<leader>hD", function() gs.diffthis("~") end, { buffer = bufnr, desc = "Diff this ~" })
        keymap.set("n", "<leader>td", gs.toggle_deleted, { buffer = bufnr, desc = "Toggle deleted" })

        -- Text object
        keymap.set({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>", { buffer = bufnr, desc = "Select hunk" })
    end
}) 