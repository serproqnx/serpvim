-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

-- Packer can manage itself
  use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'

-- Rust env
	use 'neovim/nvim-lspconfig'	
	use	{ 'Shougo/deoplete.nvim', config = 'vim.cmd[[UpdateRemotePlugins]]' }
	use 'Shougo/deoplete-lsp'
	use 'ervandew/supertab'
	use 'Chiel92/vim-autoformat'
end)
