-- require("nvim-treesitter.configs").setup({
-- 	ensure_installed = { "c", "lua", "rust" },
-- 	sync_install = false,
-- 	auto_install = false,
-- 	highlight = {
-- 		enable = true,
-- 		disable = {"lua"},
-- 		additional_vim_regex_highlighting = false,
-- 	}
-- })
require 'nvim-treesitter.install'.compilers = { "clang" }

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	ensure_installed = { "norg" },
	sync_install = false,
	ignore_install = { "" },
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		colors = {},
		termcolors = {},
	}
}

