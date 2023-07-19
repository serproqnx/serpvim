-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

-- CheckHealt recommendations
  use 'jose-elias-alvarez/null-ls.nvim'

-- Packer can manage itself
  use 'wbthomason/packer.nvim'
  	
	-- use 'ghifarit53/tokyonight-vim'
  use 'folke/tokyonight.nvim'
-- COMMENTS
  use 'tpope/vim-commentary'

-- TAGBAR
  use 'preservim/tagbar'

-- GIT
  use 'tpope/vim-fugitive'
	use 'jreybert/vimagit'


-- LUALINE
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

-- AIRLINE
	-- use 'vim-airline/vim-airline'
	-- use 'vim-airline/vim-airline-themes'
  -- use 'sheerun/vim-polyglot'

	use { 
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
	}

	use 'p00f/nvim-ts-rainbow'


	use {
		'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icons
			},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

-- Rust env
	use 'neovim/nvim-lsp'	
	use 'neovim/nvim-lspconfig'	
	use 'rust-lang/rust.vim'
  use {
      'saecki/crates.nvim',
      tag = 'v0.3.0',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
          require('crates').setup()
      end,
  }
  --
-- Completion framework
	use 'hrsh7th/nvim-cmp'

-- LSP completion source for nvim-cmp
	use 'hrsh7th/cmp-nvim-lsp'

-- Snippet completion source for nvim-cmp
	use 'hrsh7th/cmp-vsnip'

-- Other usefull completion sources
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'

-- See hrsh7th's other plugins for more completion sources!

-- To enable more of the features of rust-analyzer, such as inlay hints and more!
	use 'simrat39/rust-tools.nvim'

-- Snippet engine
	use 'hrsh7th/vim-vsnip'

-- Fuzzy finder
-- Optional
	use 'nvim-lua/popup.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'	
	use 'xiyaowong/telescope-emoji.nvim'	
	-- wiki, notetaking
	use 'renerocksai/telekasten.nvim'
	use 'renerocksai/calendar-vim'
	use 'nvim-telescope/telescope-symbols.nvim'
	use 'iamcco/markdown-preview.nvim'
	use 'mzlogin/vim-markdown-toc'
	use 'nvim-telescope/telescope-media-files.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	-- Debugging
	use 'nvim-lua/plenary.nvim'
	use 'mfussenegger/nvim-dap'
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	-- Navigation
	use 'folke/flash.nvim'
	use { 'folke/trouble.nvim', requires = { "nvim-tree/nvim-web-devicons" } }	
	use { 'folke/noice.nvim', requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify"  } }
end)
