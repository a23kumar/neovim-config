vim.g.mapleader = " "

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4        -- number of spaces that a <Tab> in the file counts for
opt.shiftwidth = 4     -- number of spaces to use for each step of (auto)indent
opt.softtabstop = 4    -- number of spaces that a <Tab> counts for while performing editing operations
opt.expandtab = true   -- use spaces instead of tabs
opt.autoindent = true  -- copy indent from current line when starting a new line
opt.smartindent = true -- do smart autoindenting when starting a new line
opt.cindent = true     -- enables automatic C program indenting
opt.breakindent = true -- enable break indent (wrapped lines will be indented)
opt.preserveindent = true -- preserve existing indents when changing indentation
opt.copyindent = true  -- copy the structure of existing lines when auto-indenting

-- better formatting and text editing
opt.formatoptions = "jcroqlnt" -- tcqj
opt.textwidth = 0      -- don't auto-wrap long lines
opt.wrapmargin = 0     -- don't auto-wrap based on margin

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- always show tabline
opt.showtabline = 2

-- time to wait for a mapped sequence to complete (in ms)
vim.opt.timeoutlen = 500
