-- vim.opt.guicursor = " "
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smarttab = true
vim.opt.tabstop = 2 
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.exrc = true 
vim.opt.hidden = true
vim.opt.errorbells = false 
vim.opt.wrap = false 
vim.opt.smartcase = true
vim.opt.swapfile = false 
vim.opt.backup = false 
vim.opt.undofile = true
vim.opt.incsearch = true 
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes" 
vim.opt.splitbelow = true

vim.opt.hlsearch = false

vim.g.mapleader = " "

vim.opt.guifont = "Iosevka Nerd Font:h12, Iosevka:h12"
vim.opt.encoding = "UTF-8"
vim.opt.wildmode = "longest,list,full"

vim.opt.termguicolors = true

-- vim.cmd("language messages English_United States")
-- vim.cmd("language messages en_US.utf8")

vim.opt.showmode = false 

vim.opt.clipboard = "unnamedplus"

-- NEOVIDE

-- vim.g.neovide_transparency = 0.8
-- vim.g.neovide_transparency_point = 0.8


-- PLATFORM

if vim.fn.has("macunix") == 1 then
  vim.g.neovide_scale_factor = 1.7
elseif vim.fn.has("win32") == 1 then
  vim.g.neovide_refrash_rate = 120
  vim.g.neovide_scale_factor = 1
  vim.cmd("language messages English_United States")
elseif vim.fn.has("unix") == 1 then
  vim.g.neovide_scale_factor = 1.0
end
