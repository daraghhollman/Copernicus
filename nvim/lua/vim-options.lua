vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set clipboard=unnamedplus")

vim.g.mapleader = " "

vim.opt.number = true
vim.wo.relativenumber = true

-- delete without yanking
vim.cmd('nnoremap <leader>d "_d')
vim.cmd('vnoremap <leader>d "_d')

-- replace currently selected text with default register
-- without yanking it
vim.cmd('vnoremap <leader>p "_dP')

-- diagnostics window
vim.cmd('nnoremap <silent> g? <cmd>lua vim.diagnostic.open_float()<CR>')
