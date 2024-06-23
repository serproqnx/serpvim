vim.g.mapleader = ' ' -- Set leader key to space

-- vim.opt.guicursor = " "

vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.o.number = true
vim.opt.relativenumber = true

vim.opt.smarttab = true -- Determines how tabs are converted to spaces.
vim.opt.tabstop = 2 -- Number of spaces a tab counts for.
vim.opt.softtabstop = 2 -- Number of spaces to insert for a tab.
vim.opt.shiftwidth = 2 -- Number of spaces to shift text when indenting or outdenting.
vim.opt.smartindent = true -- Activates smart indentation.
vim.opt.autoindent = true -- Enables automatic indentation.
vim.opt.expandtab = true -- Converts tabs to spaces.
vim.opt.exrc = true -- Enables the reading of .vimrc files in the current directory.
vim.opt.hidden = true -- Prevents unsaved changes from being lost when switching buffers.
vim.opt.errorbells = false -- Disables audible error bells.
vim.opt.wrap = false -- Disables line wrapping.
vim.opt.smartcase = true -- Activates smart case matching.
vim.opt.swapfile = false -- Disables swap files.
vim.opt.backup = false -- Disables backup files.
vim.opt.undofile = true -- Enables persistent undo history.
vim.opt.incsearch = true -- Activates incremental searching.
vim.opt.scrolloff = 8 -- Number of lines to keep above and below the cursor.
vim.opt.colorcolumn = "80" -- Sets a horizontal color column at 80 characters.
vim.opt.signcolumn = "yes" -- Enables the sign column.
vim.opt.splitbelow = true -- Forces new vertical splits below the current split.

vim.opt.hlsearch = false


-- vim.opt.guifont = "Iosevka:h12"
vim.opt.guifont = "Iosevka Nerd Font"
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
  vim.g.neovide_refrash_rate = 120
  vim.g.neovide_scale_factor = 1.0
end
