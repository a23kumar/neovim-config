-- Load core configuration first
require("a23kumar.core.options")
require("a23kumar.core.keymaps")
require("a23kumar.core.colorscheme")

-- Load basic plugins
require("a23kumar.plugins.comment")
require("a23kumar.plugins.nvim-tree")
require("a23kumar.plugins.lualine")
require("a23kumar.plugins.bufferline")
require("a23kumar.plugins.telescope")
require("a23kumar.plugins.autocompletion")
require("a23kumar.plugins.autopairs")
require("a23kumar.plugins.treesitter")
require("a23kumar.plugins.gitsigns")
require("a23kumar.plugins.indent-blankline")
require("a23kumar.plugins.flash")
require("a23kumar.plugins.neoscroll")

-- Load LSP configuration
require("a23kumar.plugins.lsp.mason")
require("a23kumar.plugins.lsp.lspconfig")
require("a23kumar.plugins.lsp.none-ls")

-- Load utility plugins
require("a23kumar.plugins.toggleterm")
require("a23kumar.plugins.bqf")
require("a23kumar.plugins.spectre")
require("a23kumar.plugins.bbye")
require("a23kumar.plugins.auto-session")
require("a23kumar.plugins.project")
require("a23kumar.plugins.notify")

-- Load UI enhancements (dressing must load before avante)
require("a23kumar.plugins.dressing")

-- Load debugging
require("a23kumar.plugins.dap")

-- Load AI assistance (temporarily disabled due to circular dependency)
require("a23kumar.plugins.avante") 