return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    key = "<C-q>",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
        vim.keymap.set("n", "<C-q>", ":NvimTreeToggle<CR>", { noremap = true })
    end,
}
