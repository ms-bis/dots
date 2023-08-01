local M = {}

M.general = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
		["<leader>mm"] = { "<cmd> Mason<CR>", "Mason" },
		["<leader>tt"] = {
			function()
				require("base46").toggle_transparency()
			end,
			"toggle transparency",
		},
		["<leader>cr"] = {
			function()
				local current_file = vim.fn.expand("%")
				local current_file_directory = vim.fn.expand("%:p:h")
				local file_name = vim.fn.expand("%:t:r")
				vim.cmd(
					"!cd "
						.. current_file_directory
						.. " && "
						.. "clang++ --debug "
						.. current_file
						.. " -o "
						.. file_name
				)
				vim.cmd(
					":vsplit | wincmd < | vertical resize 75 | terminal" .. current_file_directory .. "/" .. file_name
				)
				-- require("nvterm.terminal").send(
				-- 	"cd "
				-- 		.. current_file_directory
				-- 		.. " && "
				-- 		.. "clang++ --debug "
				-- 		.. current_file
				-- 		.. " -o "
				-- 		.. file_name
				-- 		.. " && "
				-- 		.. current_file_directory
				-- 		.. "/"
				-- 		.. file_name,
				-- 	"horizontal"
				-- )
				-- vim.cmd(":wincmd j")
			end,
			"Compile and run c++",
		},
		["<leader>cR"] = {
			function()
				local current_file = vim.fn.expand("%")
				local current_file_directory = vim.fn.expand("%:p:h")
				local file_name = vim.fn.expand("%:t:r")
				vim.cmd(
					"!cd "
						.. current_file_directory
						.. " && "
						.. "clang --debug "
						.. current_file
						.. " -o "
						.. file_name
				)
				vim.cmd(
					":vsplit | wincmd < | vertical resize 75 | terminal" .. current_file_directory .. "/" .. file_name
				)
			end,
			"Compile and run c",
		},

		["<C-x>"] = {
			function()
				vim.cmd([[normal! "0dd]])
			end,
			"delete to black hole register",
		},
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Start or continue the debugger",
		},
	},
}

M.dap_python = {
	plugin = true,
	n = {
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
		},
	},
}

return M
