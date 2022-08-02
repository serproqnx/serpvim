local nnoremap = require("serp.keymap").nnoremap

-- nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>pv", "<cmd> :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>")
nnoremap("<leader><leader>", "<cmd>source $MYVIMRC<CR>")

