local null_ls = require("null-ls")

local opts = {
    border = nil,
    cmd = { "nvim" },
    debounce = 250,
    debug = false,
    default_timeout = 5000,
    diagnostic_config = nil,
    diagnostics_format = "#{m}",
    fallback_severity = vim.diagnostic.severity.ERROR,
    log_level = "warn",
    notify_format = "[null-ls] %s",
    on_attach = nil,
    on_init = nil,
    on_exit = nil,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
    should_attach = nil,
    sources = nil,
    temp_dir = nil,
    update_in_insert = false,
}

local diag_sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofumpt,
}

null_ls.setup({
    sources = diag_sources,
    debug = true,
})

null_ls.register(diag_sources)

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
