vim.g.mapleader = " "

-- Quit
vim.keymap.set('n', "<C-q>", "<cmd>:q<CR>")

-- Saving a file via Ctrl+S
vim.keymap.set({'i', 'n'}, "<C-s>", "<cmd>:w<CR>")

