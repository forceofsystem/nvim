local M = {}
local F = {}
M.config = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {                            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        'hrsh7th/cmp-nvim-lsp',

    },
    config = function()
        local lsp = require('lsp-zero').preset({})
        M.lsp = lsp
        lsp.ensure_installed({
            'clangd',
            'pyright',
        })
        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({
                bufnr = bufnr,
            })
            require('config.plugins.autocomplete').configfunc()
            vim.diagnostic.config({
                severity_sort = true,
                underline = true,
                signs = true,
                virtual_text = false,
                update_in_insert = false,
                float = true,
            })
            lsp.buffer_autoformat()
        end)
        lsp.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })

        lsp.set_server_config({
            on_init = function(client)
                client.server_capabilities.semanticTokensProvider = nil
            end,
        })

        lsp.format_on_save({
            format_opts = {
                -- async = false,
                -- timeout_ms = 10000,
            },
        })

        F.configureDocAndSignature()
        F.configureKeybinds()

        local lspconfig = require('lspconfig')

        require('config.lsp.c').setup(lspconfig, lsp)

        lsp.setup()
        local lsp_defaults = lspconfig.util.default_config
        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )
    end
}

F.configureDocAndSignature = function()
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
            silent = true,
            focusable = false,
            border = "rounded",
        }
    )
    local group = vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
        pattern = "*",
        callback = function()
            vim.diagnostic.open_float(0, {
                scope = "cursor",
                focusable = false,
                close_events = {
                    "CursorMoved",
                    "CursorMovedI",
                    "BufHidden",
                    "InsertCharPre",
                    "WinLeave",
                },
            })
        end,
        group = group,
    })
end

F.configureKeybinds = function()
    vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
            local opts = { buffer = event.buf, noremap = true, nowait = true }

            vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', ':tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('i', '<c-f>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            -- vim.keymap.set({ 'n', 'x' }, '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
            -- vim.keymap.set('n', '<leader>aw', vim.lsp.buf.code_action, opts)
            -- vim.keymap.set('n', "<leader>,", vim.lsp.buf.code_action, opts)
            -- vim.keymap.set('x', '<leader>aw', vim.lsp.buf.range_code_action, opts)
            -- vim.keymap.set('x', "<leader>,", vim.lsp.buf.range_code_action, opts)
            -- vim.keymap.set('n', '<leader>t', ':Trouble<cr>', opts)
            vim.keymap.set('n', '<leader>-', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', '<leader>=', vim.diagnostic.goto_next, opts)
        end
    })
end

return M
