local M = {}

M.config = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-calc',
        'L3MON4D3/LuaSnip',
        {
            'onsails/lspkind.nvim',
            lazy = false,
            config = function()
                require("lspkind").init()
            end
        },
    },
}

M.configfunc = function()
    local lspkind = require('lspkind')
    lspkind.init({
        preset = 'codicons',
    })
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    cmp.setup({
        -- enable preselect
        preselect = 'item',
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        windowwindow = {
            completion = {
                -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                col_offset = -3,
                side_padding = 0,
            },
            documentation = cmp.config.window.bordered(),
        },
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = lspkind.presets.default[vim_item.kind]
                vim_item.menu = ({
                    nvim_lsp = '[LSP]',
                    buffer = '[Buffer]',
                    luasnip = '[LuaSnip]',
                    nvim_lua = '[Lua]',
                    path = '[Path]',
                    calc = '[Calc]',
                })[entry.source.name]
                return vim_item
            end,
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'luasnip' },
            { name = 'nvim_lua' },
            { name = 'path' },
            { name = 'calc' },
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
                else
                    fallback()
                end
            end,
            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
                else
                    fallback()
                end
            end,
        },
    })
end

return M
