vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set clipboard=unnamedplus")

vim.g.mapleader = " "

vim.opt.number = true
vim.wo.relativenumber = true

-- Switch colour schemes
vim.keymap.set("n", "<leader>tl", ":colorscheme rose-pine-dawn<CR>")
vim.keymap.set("n", "<leader>td", ":colorscheme rose-pine-moon<CR>")

-- Centre line on screen when moving up and down pages
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

-- Nagigate panes easier
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Navigate buffers easier
vim.keymap.set("n", "<leader>gn", ":bnext<CR>")
vim.keymap.set("n", "<leader>gp", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

-- replace currently selected text with default register
-- without yanking it
vim.cmd('vnoremap <leader>p "_dP')

-- diagnostics window
vim.cmd('nnoremap <silent> g? <cmd>lua vim.diagnostic.open_float()<CR>')

-- VimWiki
vim.cmd("let g:vimwiki_list = [{'path':'~/Main/vim_wiki'}]")
