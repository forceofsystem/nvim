-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.cmd([[
	noremap j h
	noremap k j
	noremap l k
	noremap ; l
	noremap h :
	map s <nop>
	]])

vim.keymap.set("n", "sk", ":sp<CR>", opt)
vim.keymap.set("n", "s;", ":vsp<CR>", opt)

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set("n", "<C-j>", "<C-w>h", opts)
vim.keymap.set("n", "<C-k>", "<C-w>j", opts)
vim.keymap.set("n", "<C-l>", "<C-w>k", opts)
vim.keymap.set("n", "<C-;>", "<C-w>l", opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<leader><CR>", ":nohlsearch<CR>", opts)

vim.keymap.set("n", "<A-e>", ":NvimTreeToggle<CR>", opts)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- tab
local opts = { remap = true, silent = true }
vim.keymap.set("n", "<A-u>", ":tabe<CR>", opts)
vim.keymap.set("n", "<A-k>", ":-tabnext<CR>", opts)
vim.keymap.set("n", "<A-l>", ":+tabnext<CR>", opts)

vim.cmd([[
    imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
]])
