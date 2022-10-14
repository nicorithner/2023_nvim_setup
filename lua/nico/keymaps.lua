-- Modes
--  normal_mode = 'n',
--  insert_mode = 'i',
--  visual_mode = 'v',
--  visual_block_mode = 'x',
--  term_mode = 't',
--  command_mode = 'c'

local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true }

-- Map space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Open explorer
keymap("n", "<leader>le", ":Lexplore<CR>", opts)

-- Clear search
keymap("n", "<esc>", ":nohlsearch<CR>", opts)

