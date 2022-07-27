-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
            ["rust-analyzer"] = {
        assist = {
          importEnforceGranularity = true,
          importPrefix = "crate"
          },
        cargo = {
          allFeatures = true
          },
        checkOnSave = {
          -- default: `cargo check`
          command = "clippy"
          },
        },
        inlayHints = {
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true
          },
        },
    }
}

-- require('lspconfig')['rust_analyzer'].setup{
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- 	-- Server-specific settings... 
-- 	settings = {
-- 		['rust-analyzer'] = {
-- 		assist = {
-- 			importEnforceGranularity = true,
-- 			importPrefix = "crate"
-- 		},
-- 		cargo = {
-- 			allFeatures = true
-- 		},
-- 		checkOnSave = {
-- 			--default: "cargo check"
-- 			command = "clippy"
-- 		},
-- 	},
-- 	inlayHints = {
-- 		enable = true,
-- 		useParameterNames = true
-- 	},
-- 	},
-- }


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
