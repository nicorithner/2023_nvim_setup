local options = {
  cursorline = true, -- highlight the current line
  termguicolors = true, -- set term gui colors (most terminals support this)
  winblend = 0,
  wildoptions = 'pum',
  pumblend = 5,
  background = 'dark',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

----- Illuminate

-- vim.g.Illuminate_delay = 0
-- vim.g.Illuminate_highlightUnderCursor = 0
vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
-- vim.g.Illuminate_highlightUnderCursor = 0
vim.api.nvim_set_keymap("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<a-p>",
	'<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
	{ noremap = true }
)

