vim.g.mapleader = " "

local mode_nv = { 'n', 'v' }
local mode_n = { 'n' }
local mode_v = { 'v' }

local nmappings = {
    -- options
    { from = "h",            to = ":",                                                   mode = mode_nv },
    { from = "s",            to = "<nop>" },

    -- movements
    { from = "j",            to = "h",                                                   mode = mode_nv },
    { from = "k",            to = "j",                                                   mode = mode_nv },
    { from = "l",            to = "k",                                                   mode = mode_nv },
    { from = ";",            to = "l",                                                   mode = mode_nv },

    -- Window & splits
    { from = "<leader>w",    to = "<C-w>w", },
    { from = "<leader>j",    to = "<C-w>k", },
    { from = "<leader>k",    to = "<C-w>j", },
    { from = "<leader>l",    to = "<C-w>h", },
    { from = "<leader>;",    to = "<C-w>l", },
    { from = "su",           to = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", },
    { from = "se",           to = ":set splitbelow<CR>:split<CR>", },
    { from = "sn",           to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", },
    { from = "si",           to = ":set splitright<CR>:vsplit<CR>", },
    { from = "<up>",         to = ":res +5<CR>", },
    { from = "<down>",       to = ":res -5<CR>", },
    { from = "<left>",       to = ":vertical resize-5<CR>", },
    { from = "<right>",      to = ":vertical resize+5<CR>", },

    -- Tab management
    { from = "tu",           to = ":tabnew<CR>", },
    { from = "tk",           to = ":-tabnext<CR>", },
    { from = "tl",           to = ":+tabnext<CR>", },
    { from = "<leader><CR>", to = ":nohlsearch<CR>" },
}
for _, mapping in ipairs(nmappings) do
    vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
