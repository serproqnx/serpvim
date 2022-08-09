local nnoremap = require("serp.keymap").nnoremap

nnoremap("<leader>cd", "<cmd>:cd %:h<CR>")

-- CFG
nnoremap("<leader>cfg", "<cmd>lua get_cfg_dir()<CR>")

-- nnoremap("<leader>pv", "<cmd>Ex<CR>"
nnoremap("<leader>pv", "<cmd> :Ex<CR>")

-- Telescope
nnoremap("<leader>tf", "<cmd> :Telescope find_files<CR>")
nnoremap("<leader>tg", "<cmd> :Telescope live_grep<CR>")
-- nnoremap("<leader>tr", "<cmd> :Telescope lsp_references theme=cursor<CR>")
nnoremap("<leader>tr", "<cmd> :Telescope lsp_references<CR>")

nnoremap("<leader><leader>", "<cmd>lua ReloadConfig()<CR>")

-- RUST
nnoremap("<leader>rr", "<cmd> :RustRunnables <CR>")

-- DEBUG
nnoremap("<leader>rd", "<cmd> :RustDebuggables <CR>")


if vim.fn.has("unix") == 1 then
--	print("Platform: unix")
	cfg_dir = "~/.config/nvim" 
elseif vim.fn.has("win32") == 1 then
--	print("Platform: win32")
	cfg_dir = "~/AppData/Local/nvim"
end

function get_cfg_dir() return cfg_dir end
