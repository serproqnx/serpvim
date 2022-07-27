require('lspconfig')['rust_analyzer'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
	-- Server-specific settings... 
	settings = {
		['rust-analyzer'] = {}
	}
}


-- setup rust_analyzer LSP (IDE features)
-- require('nvim_lsp').rust_analyzer.setup({})



-- Use LSP omni-completion in Rust files

-- vim.api.nvim_command('autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc')
-- vim.api.nvim_create_autocmd(



-- Enable deoplete autocompletion in Rust files

-- let g:deoplete#enable_at_startup = 1



-- customise deoplete                                                                                                                                                    -- maximum candidate window length
--
-- call deoplete#custom#source('_', 'max_menu_width', 80)



-- Press Tab to scroll _down_ a list of auto-completions

--let g:SuperTabDefaultCompletionType = "<c-n>"



-- rustfmt on write using autoformat

--autocmd BufWrite * :Autoformat



--TODO: clippy on write

--autocmd BufWrite * :Autoformat



--nnoremap <leader>c :!cargo clippy
