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

-- LSP Debuggin

-- -- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
