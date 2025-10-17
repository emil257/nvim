vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"
vim.o.relativenumber = true
vim.o.number = true

vim.cmd([[highlight LineNr guifg=#6c7086]])
vim.cmd([[highlight CursorLineNr guifg=#cdd6f4]])
vim.cmd([[highlight LineNrAbove guifg=#eba0ac]])
vim.cmd([[highlight LineNrBelow guifg=#94e2d5]])

vim.cmd([[hi Status_LineNr guifg=#6c7086]])
vim.cmd([[hi Status_DivLine guibg=#1e1e2e guifg=#313244]])
vim.cmd([[set number]])
vim.cmd([[set relativenumber]])
vim.cmd([[set cursorline]])
vim.cmd([[set signcolumn=yes:1]])
-- vim.opt.statuscolumn = "%C%s%#Status_LineNr#%3.3l%* %-2.2r%#Status_DivLine#|%* "

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
