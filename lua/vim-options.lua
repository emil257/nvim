vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"
vim.o.relativenumber = true
vim.o.number = true

vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Center cursor after moving down half-page"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Center cursor after moving up half-page"})

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<s-l>', ':bnext <CR>')
vim.keymap.set('n', '<s-h>', ':bprev <CR>')
vim.keymap.set('n', '<leader>d', ':bd <CR>')
vim.keymap.set('n', '<leader>w', ':wa <CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
