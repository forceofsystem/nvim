return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-live-grep-args.nvim',
    },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        local actions = require('telescope.actions')
        require('telescope').setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = {
                    shorten = {
                        -- e.g. for a path like
                        --   `alpha/beta/gamma/delta.txt`
                        -- setting `path_display.shorten = { len = 1, exclude = {1, -1} }`
                        -- will give a path like:
                        --   `alpha/b/g/delta.txt`
                        len = 3,
                        exclude = { 1, -1 }
                    },
                },
                mappings = {
                    i = {
                        ['<C-n>'] = actions.cycle_history_next,
                        ['<C-p>'] = actions.cycle_history_prev,

                        ['<C-k>'] = actions.move_selection_next,
                        ['<C-l>'] = actions.move_selection_previous,

                        ['<esc>'] = actions.close
                    }
                }
            },
            pickers = {
                find_files = {
                    theme = 'dropdown',
                    find_command = { "fd", "-H", "-I" },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = false,
                    override_file_sorter = true,
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                live_grep_raw = {
                    auto_quoting = false,
                },
            }
        })
    end
}
