return {
    setup = function(lspconfig, lsp)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.offsetEncoding = { "utf-16" }
        lspconfig.clangd.setup({ capabilities = capabilities })
    end
}
