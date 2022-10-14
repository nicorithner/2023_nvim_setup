local options = {
  autoindent = true,
  background = "dark",
  backspace = { "start", "eol", "indent" },
  backup = false, -- creates a backup file
  breakindent = true,
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  encoding = 'utf-8',
  expandtab = true, -- convert tabs to spaces
  fileencoding = "utf-8", -- the encoding written to a file
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  hlsearch = true, -- highlight all matches on previous search pattern
  inccommand = "split",
  ignorecase = true, -- ignore case in search patterns unless /C or Capital in search
  mouse = "a", -- allow the mouse to be used in neovim
  numberwidth = 4, -- set number column width to 2 {default 4}
  number = true, -- set numbered lines
  laststatus = 2,
  pumheight = 10, -- pop up menu height
  relativenumber = false, -- set relative numbered lines
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  scrolloff = 8, -- is one of my fav
  shell = 'zsh',
  shiftwidth = 2,
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  showcmd = true,
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  sidescrolloff = 8,
  smartcase = true, -- smart case
  smarttab = true,
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  tabstop = 2, -- insert 2 spaces for a tab
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true,
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  wrap = true, --  change to false display lines as one long line
  updatetime = 300, -- faster completion (4000ms default)
  undofile = true, -- enable persistent undo
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.ruby_host_prog = "rvm system do neovim-ruby-host"
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.shortmess:append("c")

-- Netrw window size
vim.g.netrw_winsize = "30"
vim.g.netrw_browse_split = "3"
vim.g.netrw_banner = 0

-- Markdown
vim.g.markdown_fenced_languages = {
	"bash=sh",
	"css",
	"javascript",
	"js=javascript",
	"json=javascript",
	"jsx=javascript",
	"ruby",
	"sass",
	"xml",
	"html",
}

-- Stop comments on newline
vim.cmd([[autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o]])

