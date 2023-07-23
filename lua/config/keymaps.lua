vim.g.mapleader = " "

local mode_nv = { 'n', 'v' }
local mode_n = { 'n' }
local mode_v = { 'v' }

vim.cmd([[
    noremap j h
    noremap k j
    noremap l k
    noremap ; l
    noremap h :
]])

local nmappings = {
    -- options
    { from = "s",            to = "<nop>" },

    -- Window & splits
    { from = "<leader>w",    to = "<C-w>w", },
    { from = "<C-l>",        to = "<C-w>k", },
    { from = "<C-k>",        to = "<C-w>j", },
    { from = "<C-j>",        to = "<C-w>h", },
    { from = "<C-;>",        to = "<C-w>l", },
    { from = "sj",           to = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", },
    { from = "sk",           to = ":set splitbelow<CR>:split<CR>", },
    { from = "sl",           to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", },
    { from = "s;",           to = ":set splitright<CR>:vsplit<CR>", },
    { from = "<up>",         to = ":res +5<CR>", },
    { from = "<down>",       to = ":res -5<CR>", },
    { from = "<left>",       to = ":vertical resize-5<CR>", },
    { from = "<right>",      to = ":vertical resize+5<CR>", },

    -- Tab management
    { from = "<A-u>",        to = ":tabnew<CR>", },
    { from = "<A-k>",        to = ":-tabnext<CR>", },
    { from = "<A-l>",        to = ":+tabnext<CR>", },
    { from = "<leader><CR>", to = ":nohlsearch<CR>" },
}
for _, mapping in ipairs(nmappings) do
    vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
