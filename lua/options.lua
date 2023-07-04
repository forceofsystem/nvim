vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = 'utf-8'
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 5
vim.opt.foldlevel = 99
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.updatetime = 100
vim.opt.tw = 0
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.autochdir = true
vim.opt.autowrite = true
vim.opt.laststatus = 2

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.cmd([[exec "nohlsearch"]])
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

vim.g.terminal_key = '<F12>'
vim.g.terminal_kill = 1
vim.g.terminal_close = 1

vim.cmd([[
    let g:dbs = []
    let g:db_ui_save_location = '~/.config/dbui'
]])

-- vim.cmd([[autocmd InsertLeave * :silent !im-select com.apple.keylayout.ABC]])
-- Translate to lua
vim.api.nvim_create_autocmd(
    'InsertLeave',
    {
        pattern = '*',
        command = 'silent! !im-select com.apple.keylayout.ABC',
    }
)
