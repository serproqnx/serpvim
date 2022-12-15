local nnoremap = require("serp.keymap").nnoremap

if vim.fn.has("unix") == 1 then
--	print("Platform: unix")
  run_term_string = "term://bash"
	cfg_dir = "~/.config/nvim" 
elseif vim.fn.has("win32") == 1 then
--	print("Platform: win32")"
  run_term_string = ":vsplit term://pwsh"
  nnoremap("<leader>1", "<cmd>split term://pwsh<CR>")
	cfg_dir = "~/AppData/Local/nvim"
end

function get_term() return run_term_string end
function get_cfg_dir() return cfg_dir end
-- TERMINAL

--nnoremap("<leader>`", "<cmd>lua get_term()<CR>")

nnoremap("<leader>cd", "<cmd>:cd %:h<CR>")

-- CFG
nnoremap("<leader>cfg", "<cmd>lua get_cfg_dir()<CR>")

-- nnoremap("<leader>pv", "<cmd>Ex<CR>"
nnoremap("<leader>pv", "<cmd> :Ex<CR>")

-- Telescope
nnoremap("<leader>tf", "<cmd> :Telescope find_files theme=dropdown<CR>")
nnoremap("<leader>tg", "<cmd> :Telescope live_grep theme=dropdown<CR>")
-- nnoremap("<leader>tr", "<cmd> :Telescope lsp_references theme=cursor<CR>")
nnoremap("<leader>tr", "<cmd> :Telescope lsp_references<CR>")

nnoremap("<leader><leader>", "<cmd>lua ReloadConfig()<CR>")

-- RUST
nnoremap("<leader>rr", "<cmd> :RustRunnables <CR>")
nnoremap("<leader>ra", "<cmd> :RustCodeAction <CR>")

-- DEBUG
nnoremap("<leader>rd", "<cmd> :RustDebuggables <CR>")

-- Telekasten
nnoremap("<leader>zf", ":lua require('telekasten').find_notes()<CR>")
nnoremap("<leader>zd", ":lua require('telekasten').find_daily_notes()<CR>")
nnoremap("<leader>zg", ":lua require('telekasten').search_notes()<CR>")
nnoremap("<leader>zz", ":lua require('telekasten').follow_link()<CR>")

nnoremap("<leader>z", ":lua require('telekasten').panel()<CR>")

