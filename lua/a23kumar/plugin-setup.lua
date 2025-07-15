local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()
-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- lua functions that many plugins use
    use("nvim-lua/plenary.nvim")
    
    use("bluz71/vim-nightfly-guicolors") -- preferred color scheme

    -- tmux & split window navigation
    use("christoomey/vim-tmux-navigator")

    use("szw/vim-maximizer") -- maximizes and restores current window
    
    -- essential plugins
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")

    -- commenting with gc
    use("numToStr/Comment.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- bufferline (VS Code-like tabs)
    use("akinsho/bufferline.nvim")

    -- fuzzy finding
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

    -- LSP Support
    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/mason.nvim") -- simple to use language server installer
    use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
    use("nvimtools/none-ls.nvim") -- for formatters and linters (fork of null-ls)

    -- Debugging
    use("mfussenegger/nvim-dap") -- debug adapter protocol client
    use("rcarriga/nvim-dap-ui") -- UI for nvim-dap
    use("theHamsta/nvim-dap-virtual-text") -- virtual text for debugging
    use("nvim-telescope/telescope-dap.nvim") -- telescope integration for dap

    -- Autocompletion
    use("hrsh7th/nvim-cmp") -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use("hrsh7th/cmp-nvim-lua") -- for autocompletion
    use("onsails/lspkind.nvim") -- vs-code like pictograms

    -- Snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("rafamadriz/friendly-snippets") -- useful snippets
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    -- Git integration
    use("lewis6991/gitsigns.nvim")

    -- Auto pairs
    use("windwp/nvim-autopairs")

    -- Indent guides
    use("lukas-reineke/indent-blankline.nvim")

    -- Better terminal
    use("akinsho/toggleterm.nvim")

    -- Better quickfix
    use("kevinhwang91/nvim-bqf")

    -- Better search and replace
    use("nvim-pack/nvim-spectre")

    -- Better buffer management
    use("moll/vim-bbye")

    -- Better session management
    use("rmagatti/auto-session")

    -- Better project management
    use("ahmedkhalf/project.nvim")

    -- Better notifications
    use("rcarriga/nvim-notify")

    -- Better UI
    use("stevearc/dressing.nvim")

    -- Better search
    use("folke/flash.nvim")

    -- Smooth scrolling
    use("karb94/neoscroll.nvim")

    -- AI-powered code assistance (Cursor-like IDE)
    use({
        "yetone/avante.nvim",
        run = function()
            if vim.fn.has("win32") == 1 then
                return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            else
                return "make"
            end
        end,
        config = function() 
            require("avante").setup({
                ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
                provider = "openai", -- Default provider
                auto_set_keymaps = false, -- We handle keymaps manually

                -- Provider configurations
                openai = {
                    endpoint = "https://api.openai.com/v1",
                    model = "gpt-4o",
                    timeout = 30000,
                    temperature = 0.7,
                    max_tokens = 4096,
                },
                claude = {
                    endpoint = "https://api.anthropic.com",
                    model = "claude-3-5-sonnet-20241022",
                    timeout = 30000,
                    temperature = 0.75,
                    max_tokens = 4096,
                },
                gemini = {
                    endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
                    model = "gemini-1.5-pro-latest",
                    timeout = 30000,
                    temperature = 0.7,
                },

                behaviour = {
                    auto_suggestions = false,
                    auto_set_highlight_group = true,
                    auto_apply_diff_after_generation = false,
                    support_paste_from_clipboard = false,
                    minimize_diff = true,
                },

                windows = {
                    position = "right",
                    width = 30,
                    wrap = true,
                },

                highlights = {
                    diff = {
                        current = "DiffText",
                        incoming = "DiffAdd",
                    },
                },
            })
        end,
        requires = {
            "stevearc/dressing.nvim", -- for enhanced input UI
            "HakonHarnes/img-clip.nvim", -- for image pasting support
            "MunifTanjim/nui.nvim", -- for UI components used by avante
        },
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end) 
