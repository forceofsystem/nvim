return {
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require('illuminate').configure({
                providers = {
                    -- 'lsp',
                    -- 'treesitter',
                    'regex',
                },
            })
            vim.cmd("hi IlluminatedWordText guibg=#393E4D gui=none")
        end
    },
    { 'gcmt/wildfire.vim', lazy = false, },
}
