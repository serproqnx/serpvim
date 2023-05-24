vim.g.rust_recommended_style = false

local nvim_lsp = require'lspconfig'

-- debug

if vim.fn.has("unix") == 1 then
--	print("Platform: unix")
	extension_path = vim.env.HOME .. '/.vscode-oss/extensions/vadimcn.vscode-lldb-1.7.3/'
	codelldb_path = extension_path .. 'adapter/codelldb'
	liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
elseif vim.fn.has("win32") == 1 then
--	print("Platform: win32")
	extension_path = vim.env.HOME .. '\\.vscode\\extensions\\vadimcn.vscode-lldb-1.7.3\\'
	codelldb_path = extension_path .. 'adapter\\codelldb'
	liblldb_path = extension_path .. 'lldb\\bin\\liblldb.dll'
end

-- print(extension_path)
-- print(codelldb_path)
-- print(liblldb_path)

local opts = {
		dap = {
			adapter = require('rust-tools.dap').get_codelldb_adapter(
				codelldb_path, liblldb_path		
			)
		},
    tools = { -- rust-tools options
        autoSetHints = true,
        --hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                inlayHints = { locationLinks = false },
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)

--
-- require("dapui").setup()

local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local bufopts = { noremap=true, silent=true, buffer=bufnr }

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
-- vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts, { async = true })
--
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }

-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
-- 
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--   vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--   vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--   vim.keymap.set('n', '<leader>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, bufopts)
--   vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
--   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
--   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--   vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
-- end
-- 
-- local lsp_flags = {
--   -- This is the default in Nvim 0.7+
--   debounce_text_changes = 150,
-- }
-- -- require('lspconfig')['pyright'].setup{
-- --    on_attach = on_attach,
-- --    flags = lsp_flags,
-- --}
-- --require('lspconfig')['tsserver'].setup{
-- --    on_attach = on_attach,
-- --    flags = lsp_flags,
-- --}
-- -- Update this path
-- local extension_path = vim.env.HOME .. '/.vscode-oss/extensions/vadimcn.vscode-lldb-1.7.3'
-- local codelldb_path = extension_path .. 'adapter/codelldb'
-- local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
-- 
-- local rust_opts = {
--    on_attach = on_attach,
--    flags = lsp_flags,
--     -- ... other configs
--     dap = {
--         adapter = require('rust-tools.dap').get_codelldb_adapter(
--             codelldb_path, liblldb_path)
--     }
-- }
-- 
-- -- Normal setup
-- require('rust-tools').setup(rust_opts)

-- require('lspconfig')['rust_analyzer'].setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     -- Server-specific settings...
--     settings = {
--       ["rust-analyzer"] = {
--         assist = {
--           importEnforceGranularity = true,
--           importPrefix = "crate"
--         },
--         cargo = {
--           allFeatures = true
--         },
--         checkOnSave = {
--           -- default: `cargo check`
--           command = "clippy"
--         },
--         inlayHints = {
-- 					typeHints = {
-- 						enable = true,
-- 					},
-- 					renderColons = {
-- 						enable = true,
-- 					},
--           lifetimeElisionHints = {
--             enable = true,
--             useParameterNames = true
--           }
--         }
--     }
-- 	}
-- }

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
