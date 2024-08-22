return {
    "ayu-theme/ayu-vim",
    priority = 1001,
    config = function()
        vim.cmd("set termguicolors")
        vim.cmd("let ayucolor='dark'")
        vim.cmd("colorscheme ayu")
    end
}

