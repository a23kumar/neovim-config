local status, spectre = pcall(require, "spectre")
if not status then
    return
end

spectre.setup({
    color_devicons = true,
    open_cmd = "vnew",
    live_update = false,
    line_sep_start = "┌-----------------------------------------",
    result_padding = "¦  ",
    line_sep = "└-----------------------------------------",
    highlight = {
        ui = "String",
        search = "DiffChange",
        replace = "DiffDelete"
    },
    mapping = {
        ["toggle_line"] = {
            map = "dd",
            cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
            desc = "toggle current item"
        },
        ["enter_file"] = {
            map = "<cr>",
            cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
            desc = "goto current file"
        },
        ["send_to_qf"] = {
            map = "<leader>q",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all item to quickfix"
        },
        ["replace_cmd"] = {
            map = "<leader>c",
            cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
            desc = "input replace vim command"
        },
        ["show_option_menu"] = {
            map = "<leader>o",
            cmd = "<cmd>lua require('spectre').show_options()<CR>",
            desc = "show option"
        },
        ["run_current_replace"] = {
            map = "<leader>rc",
            cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
            desc = "replace current line"
        },
        ["run_replace"] = {
            map = "<leader>R",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "replace all"
        },
        ["change_view_mode"] = {
            map = "<leader>v",
            cmd = "<cmd>lua require('spectre').change_view()<CR>",
            desc = "change result view mode"
        },
        ["change_replace_sed"] = {
            map = "trs",
            cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
            desc = "use sed to replace"
        },
        ["change_replace_oxi"] = {
            map = "tro",
            cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
            desc = "use oxi to replace"
        },
        ["toggle_live_update"] = {
            map = "tu",
            cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
            desc = "update change when vim write file."
        },
        ["toggle_ignore_case"] = {
            map = "ti",
            cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
            desc = "toggle ignore case"
        },
        ["toggle_ignore_hidden"] = {
            map = "th",
            cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
            desc = "toggle search hidden"
        },
        ["resume_last_search"] = {
            map = "<leader>l",
            cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
            desc = "resume last search before close"
        },
    },
    find_engine = {
        ["rg"] = {
            cmd = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
            },
            options = {
                ["ignore-case"] = {
                    value = "--ignore-case",
                    icon = "[I]",
                    desc = "ignore case"
                },
                ["hidden"] = {
                    value = "--hidden",
                    desc = "hidden file",
                    icon = "[H]"
                },
            }
        },
    },
    replace_engine = {
        ["sed"] = {
            cmd = "sed",
            args = nil,
            options = {
                ["ignore-case"] = {
                    value = "--ignore-case",
                    icon = "[I]",
                    desc = "ignore case"
                },
            }
        },
    },
    default = {
        find = {
            cmd = "rg",
            options = { "ignore-case" }
        },
        replace = {
            cmd = "sed"
        }
    },
    replace_vim_cmd = "cdo",
    is_open_target_win = true,
    is_insert_mode = false
})

-- Keymaps
local keymap = vim.keymap

keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', { desc = "Search on current file" }) 