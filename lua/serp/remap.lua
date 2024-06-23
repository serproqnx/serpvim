local nnoremap = require("serp.keymap").nnoremap
local vnoremap = require("serp.keymap").vnoremap

if vim.fn.has("unix") == 1 then
--	print("Platform: unix")
  run_term_string = "term://bash"
  nnoremap("<leader>`", "<cmd>split term://bash<CR>")
	cfg_dir = "~/.config/nvim"
elseif vim.fn.has("win32") == 1 then
--	print("Platform: win32")"
  run_term_string = ":vsplit term://pwsh"
  nnoremap("<leader>`", "<cmd>split term://pwsh -noprofile<CR>")
	cfg_dir = "~/AppData/Local/nvim"
end

function get_term() return run_term_string end
function get_cfg_dir() return cfg_dir end

-- TERMINAL
--nnoremap("<leader>`", "<cmd>lua get_term()<CR>")
nnoremap("<leader>cd", "<cmd>:cd %:h<CR>")

-- CFG
nnoremap("<leader>cfg", "<cmd>lua get_cfg_dir()<CR>")
-- nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>pv", "<cmd> :Oil<CR>")

-- Telescope


nnoremap("<leader>tp", "<cmd> :Telescope projects theme=dropdown<CR>")
nnoremap("<leader>tb", "<cmd> :Telescope file_browser theme=dropdown<CR>")
nnoremap("<leader>te", "<cmd> :Telescope emoji<CR>")
nnoremap("<leader>tf", "<cmd> :Telescope find_files theme=dropdown<CR>")
nnoremap("<leader>tg", "<cmd> :Telescope live_grep theme=dropdown<CR>")
-- nnoremap("<leader>tr", "<cmd> :Telescope lsp_references theme=cursor<CR>")
nnoremap("<leader>tr", "<cmd> :Telescope lsp_references<CR>")
nnoremap("<leader><leader>", "<cmd>lua ReloadConfig()<CR>")
nnoremap("<leader>tn", "<cmd> :Noice telescope<CR>")

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

-- Flash
nnoremap("m", [[<cmd>lua require('flash').jump({ search = { mode = function(str) return "\\<" .. str end, }, })<CR>]])
		-- 			require("flash").jump()
		-- 			require("flash").treesitter()
		-- 			require("flash").remote()
		-- 			require("flash").treesitter_search()
		-- 			require("flash").toggle()

-- Trouble

-- nnoremap("<leader>xx", "<cmd>TroubleToggle<CR>")
-- nnoremap("<leader>xx", "<cmd>TroubleToggle<CR>")

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

-- AI Gen
vnoremap("<leader>a", ":Gen<CR>")
nnoremap("<leader>ai", ":Gen <CR>")
