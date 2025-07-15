local status, null_ls = pcall(require, "none-ls")
if not status then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier,
        formatting.stylua,
        formatting.black,
        formatting.isort,
        formatting.gofmt,
        formatting.rustfmt,
        formatting.clang_format,
        diagnostics.eslint_d,
        diagnostics.flake8,
        diagnostics.golangci_lint,
        diagnostics.clang_check,
    },
}) 