local fn = vim.fn
local status_ok, packer = pcall(require, "packer")
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Automatically install packer
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
if not status_ok then
	return
end

vim.cmd([[packadd packer.nvim]])

return packer.startup(function(use)
	-- Have packer manage itself
	use("wbthomason/packer.nvim")

	--------- Plugins without additional configuration
	use("tpope/vim-fugitive") -- https://github.com/tpope/vim-fugitive
	use("airblade/vim-gitgutter") -- https://github.com/airblade/vim-gitgutter
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }) -- preview markdown
	use("sbdchd/neoformat") -- formatter https://github.com/sbdchd/neoformahttps://github.com/sbdchd/neoformatt
	use("neomake/neomake") -- https://github.com/neomake/neomake
	use("kyazdani42/nvim-web-devicons") -- https://github.com/kyazdani42/nvim-web-devicons
	use("nvim-lua/plenary.nvim") -- https://github.com/nvim-lua/plenary.nvim
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API fjjrom vim in Neovim
	use("tpope/vim-surround") -- changes surrounding quotes or brackets and more. https://github.com/tpope/vim-surround
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("NvChad/nvim-colorizer.lua") --https://github.com/NvChad/nvim-colorizer.lua
	use("sangdol/mintabline.vim") -- https://github.com/Sangdol/mintabline.vim
	use("wakatime/vim-wakatime")

	-- Autocompletion

	use("hrsh7th/nvim-cmp") -- The completion plugin -- https://github.com/hrsh7th/nvim-cmp
	use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" }) -- nvim-cmp source for neovim Lua API -- https://github.com/hrsh7th/cmp-nvim-lua
	use({ "hrsh7th/cmp-omni", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }) -- nvim-cmp source for neovim's built-in language server client. -- https://github.com/hrsh7th/cmp-nvim-lsp
	use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }) -- buffer completions -- https://github.com/hrsh7th/cmp-buffer
	use({ "hrsh7th/cmp-path", after = "cmp-buffer" }) -- path completions -- https://github.com/hrsh7th/cmp-path
	use({ "hrsh7th/cmp-cmdline", after = "cmp-path" }) -- cmdline completions -- https://github.com/hrsh7th/cmp-cmdline
	use({ "hrsh7th/cmp-calc", after = "cmp-cmdline" })
	if vim.g.is_mac then
		use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
	end
	use("mfussenegger/nvim-jdtls") -- https://github.com/mfussenegger/nvim-jdtls

	-- Autocompletion Snippets
	use("saadparwaiz1/cmp_luasnip") -- snippet completions -- https://github.com/saadparwaiz1/cmp_luasnip
	-- "L3MON4D3/LuaSnip" snippet engine -- https://github.com/L3MON4D3/LuaSnip
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use -- https://github.com/rafamadriz/friendly-snippets
	use("honza/vim-snippets") -- https://github.com/honza/vim-snippets

	-- Autopairs
	use("windwp/nvim-autopairs") -- https://github.com/windwp/nvim-autopairs

	-- Autotags
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- https://github.com/windwp/nvim-ts-autotag

	-- Colorschemes
	use("folke/tokyonight.nvim")
	-- use("navarasu/onedark.nvim")
	-- use("EdenEast/nightfox.nvim") -- https://github.com/EdenEast/nightfox.nvim

	-- Comments
	use("terrortylor/nvim-comment") -- https://github.com/terrortylor/nvim-comment

	-- Gitsigns
	use({
		"lewis6991/gitsigns.nvim", -- https://github.com/lewis6991/gitsigns.nvim
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- Illuminate
	use("RRethy/vim-illuminate") -- https://github.com/RRethy/vim-illuminate

	-- Impatient
	use("lewis6991/impatient.nvim")

	-- Indent line
	use("lukas-reineke/indent-blankline.nvim") -- https://github.com/lukas-reineke/indent-blankline.nvim

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim") -- https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim
	use({
		"folke/trouble.nvim", -- https://github.com/folke/trouble.nvim
		cmd = "TroubleToggle",
	}) -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
	use("ray-x/lsp_signature.nvim") -- Show function signature when you type -- https://github.com/ray-x/lsp_signature.nvim

	-- Lualine
	use("nvim-lualine/lualine.nvim") -- https://github.com/nvim-lualine/lualine.nvim

	-- Nvim-tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("nvim-telescope/telescope-file-browser.nvim") -- https://github.com/nvim-telescope/telescope-file-browser.nvim
	use("nvim-telescope/telescope-fzy-native.nvim") -- https://github.com/nvim-telescope/telescope-fzy-native.nvim

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("nvim-treesitter/nvim-treesitter-refactor") -- https://github.com/nvim-treesitter/nvim-treesitter-refactor
	use("RRethy/nvim-treesitter-endwise") -- https://github.com/RRethy/nvim-treesitter-endwise

	---------------------- *** ------------------------ *** ------------------------ *** -------------------------

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
