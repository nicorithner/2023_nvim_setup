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

vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)
  -- Have packer manage itself
  use("wbthomason/packer.nvim")

 	--------- Plugins without additional configuration
	use("tpope/vim-fugitive") -- https://github.com/tpope/vim-fugitive
	use("airblade/vim-gitgutter") -- https://github.com/airblade/vim-gitgutter
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }) -- preview markdown
	use("sbdchd/neoformat") -- formatter https://github.com/sbdchd/neoformahttps://github.com/sbdchd/neoformatt
	use("kyazdani42/nvim-web-devicons") -- https://github.com/kyazdani42/nvim-web-devicons
	use("nvim-lua/plenary.nvim") -- https://github.com/nvim-lua/plenary.nvim
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API fjjrom vim in Neovim
	use("tpope/vim-surround") -- changes surrounding quotes or brackets and more. https://github.com/tpope/vim-surround

	-- Colorschemes
	use("folke/tokyonight.nvim")

  -- LSP
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use ("neovim/nvim-lspconfig")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
  	require("packer").sync()
  end
end)
