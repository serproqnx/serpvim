local nnoremap = require("serp.keymap").nnoremap


-- nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>pv", "<cmd> :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")

-- Telescope
nnoremap("<leader>tf", "<cmd> :Telescope find_files<CR>")
nnoremap("<leader>tg", "<cmd> :Telescope live_grep<CR>")
-- nnoremap("<leader>tr", "<cmd> :Telescope lsp_references theme=cursor<CR>")
nnoremap("<leader>tr", "<cmd> :Telescope lsp_references<CR>")


nnoremap("<leader><leader>", "<cmd>lua ReloadConfig()<CR>")


