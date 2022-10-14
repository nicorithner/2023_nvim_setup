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
