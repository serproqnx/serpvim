 -- In Vim, a keymap (also known as a mapping) is an association between a sequence of keys and a command or series of commands that will execute when the keys are pressed in command-line mode. Here are some common types of keymaps:

-- 1. nmap: Normal mode mappings. These are keybindings that can be used while in normal mode (default mode when you first enter Vim). You can press `Esc` to enter this mode.
-- 2. nnoremap: Non-recursive normal mode mappings, also called non-remappable normal mode mappings. These are similar to nmap but cannot be remapped themselves. This is useful if you don't want a keybinding to change accidentally due to other configurations or plugins.
-- 3. vnoremap: Visual mode mappings. These are keybindings that can be used while in visual modes (select, visual line, etc.). You enter these modes by pressing `v` followed by one of the movement keys (e.g., `j`, `k`, `h`, `l`) or other commands like `V`, `gv`, etc.
-- 4. xnoremap: Ex mode mappings. These are keybindings that can be used while in ex command mode, which is entered by pressing the colon (`:`) key. They can also be useful for defining leader-based mappings or plugins.
-- 5. inoremap: Insert mode mappings. These are keybindings that can be used while in insert mode, where you can edit text directly. You enter this mode by pressing `i`, `a`, `o`, etc., on a line.
-- 6. cnoremap: Command-line noremap (similar to xnoremap). These are keybindings that can be used in the command-line window, like when using `:reg/pat/flags` or `:make`. They can also be useful for defining leader-based mappings or plugins.

-- Each type of keymap is defined with a specific operation (n, v, i, x, c, etc.) and may include options such as "noremap," which prevents the keybinding from being remapped by other configurations or plugins. You can create your own custom keymaps using functions like `M.nmap`, `M.nnoremap`, etc., in your Vim configuration files.

local M = {}

local function bind(op, outer_opts)
	outer_opts = outer_opts or {noremap = true}
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force",
			outer_opts,
			opts or {}
		)
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")

return M
