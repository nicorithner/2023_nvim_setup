-- Modes
--  normal_mode = 'n',
--  insert_mode = 'i',
--  visual_mode = 'v',
--  visual_block_mode = 'x',
--  term_mode = 't',
--  command_mode = 'c'

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Buffer Resize
keymap('n', '<leader>[', ':vertical resize +5<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>]', ':vertical resize -5<CR>', { noremap = true, silent = true })

-- Clear search
keymap("n", "<leader>k", ":nohlsearch<CR>", opts)

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nvimtree
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)

-- Open explorer
-- keymap("n", "<leader>le", ":Lexplore<CR>", opts)

-- Toggle LSP Diagnostics
keymap("n", "<Leader>dd", ":ToggleDiag<CR>", { noremap = true, silent = true })
keymap("n", "<leader>du", "<Plug>(toggle-lsp-diag-underline)", { silent = true })
keymap("n", "<leader>ds", "<Plug>(toggle-lsp-diag-signs)", { silent = true })
keymap("n", "<leader>dv", "<Plug>(toggle-lsp-diag-vtext)", { silent = true })
keymap("n", "<leader>di", "<Plug>(toggle-lsp-diag-update_in_insert)", { silent = true })
