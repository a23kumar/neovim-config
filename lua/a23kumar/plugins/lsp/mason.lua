local status, mason = pcall(require, "mason")
if not status then
    return
end

local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
    return
end

-- Mason setup with better configuration
mason.setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
})

-- Mason-lspconfig setup with automatic installation disabled initially
mason_lspconfig.setup({
    -- Don't automatically install servers to avoid popup errors
    -- Users can manually install via :Mason command
    ensure_installed = {},
    
    -- Available servers that can be installed manually
    -- "lua_ls", "ts_ls", "html", "cssls", "emmet_ls", 
    -- "jsonls", "yamlls", "bashls", "clangd", "rust_analyzer", 
    -- "gopls", "pyright", "jdtls"
    
    automatic_installation = false,
})

-- Optional: Auto-install only common/essential servers
-- Uncomment the lines below if you want to auto-install specific servers
-- mason_lspconfig.setup({
--     ensure_installed = { "lua_ls", "ts_ls" },
--     automatic_installation = true,
-- }) 