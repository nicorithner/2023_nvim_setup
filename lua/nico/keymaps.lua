-- Modes
--  normal_mode = 'n',
--  insert_mode = 'i',
--  visual_mode = 'v',
--  visual_block_mode = 'x',
--  term_mode = 't',
--  command_mode = 'c'

local builtin = require("telescope.builtin")
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Buffer Resize
keymap("n", "<Leader>[", ":vertical resize +5<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>]", ":vertical resize -5<CR>", { noremap = true, silent = true })

-- Clear search
keymap("n", "<Space>k", ":nohlsearch<CR>", opts)

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nvimtree
keymap("n", "<Leader>n", ":NvimTreeToggle<cr>", opts)

-- Open explorer
-- keymap("n", "<leader>le", ":Lexplore<CR>", opts)

-- Telescope
vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fg", builtin.live_grep, {})
vim.keymap.set("n", "fb", builtin.buffers, {})
vim.keymap.set("n", "fh", builtin.help_tags, {})
vim.keymap.set("n", "fo", builtin.oldfiles, {})

-- Toggle LSP Diagnostics
keymap("n", "<Leader>dd", ":ToggleDiag<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>du", "<Plug>(toggle-lsp-diag-underline)", { silent = true })
keymap("n", "<Leader>ds", "<Plug>(toggle-lsp-diag-signs)", { silent = true })
keymap("n", "<Leader>dv", "<Plug>(toggle-lsp-diag-vtext)", { silent = true })
keymap("n", "<Leader>di", "<Plug>(toggle-lsp-diag-update_in_insert)", { silent = true })
