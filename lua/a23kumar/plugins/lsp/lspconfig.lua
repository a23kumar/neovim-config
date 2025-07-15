local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
    return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local keymap = vim.keymap

    keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP servers
nvim_lsp.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}

nvim_lsp.ts_ls.setup { -- Changed from tsserver
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.jdtls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
} 