local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

treesitter.setup({
    ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "yaml",
        "bash",
        "c",
        "cpp",
        "rust",
        "go",
        "python",
        "java",
        "vim",
        "markdown",
        "toml",
        "dockerfile",
        "sql",
        "php",
        "ruby",
        "scala",
        "swift",
        "kotlin",
        "dart",
        "elixir",
        "haskell",
        "ocaml",
        "r",
        "julia",
        "zig",
        "nix",
        "cmake",
        "make",
        "gitignore",
        "gitcommit",
        "diff",
        "comment",
        "regex",
        "query",
        "scheme",
        "clojure",
        "fennel",
        "racket",
        "commonlisp",
        "erlang",
        "gleam",
        "nim",
        "pascal",
        "ada",
        "fortran",
        "perl",
        "tcl",
        "awk",
        "fish",
        "powershell",
        "ini",
        "jsonc",
        "json5",
        "graphql",
        "vue",
        "svelte",
        "astro",
        "solidity",
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        lsp_interop = {
            enable = true,
            border = "none",
            floating_preview_opts = {},
            peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dF"] = "@class.outer",
            },
        },
    },
}) 