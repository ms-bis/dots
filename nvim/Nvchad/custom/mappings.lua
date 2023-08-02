local M = {}

local function compile_and_run()
	local current_file = vim.fn.expand("%")
	local current_file_directory = vim.fn.expand("%:p:h")
	local file_name = vim.fn.expand("%:t:r")
	vim.cmd(":w")
	if vim.bo.filetype == "c" then
		vim.cmd("!cd " .. current_file_directory .. " && clang --debug " .. current_file .. " -o " .. file_name)
	elseif vim.bo.filetype == "cpp" then
		vim.cmd("!cd " .. current_file_directory .. " && clang++ --debug " .. current_file .. " -o " .. file_name)
	else
		print("Unsupported file type for compilation and running.")
		return
	end
	vim.cmd(":vsplit | wincmd < | vertical resize 75 | terminal " .. current_file_directory .. "/" .. file_name)
end

-- Autocommands to set filetypes for C and C++ files
vim.cmd([[
    augroup NvchadFileType
        autocmd!
        autocmd BufNewFile,BufRead *.c set filetype=c
        autocmd BufNewFile,BufRead *.cpp set filetype=cpp
    augroup END
]])

M.general = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
		["<leader>mm"] = { "<cmd> Mason<CR>", "Mason" },
		["<F5>"] = { compile_and_run, "Compile and run" },
		["<leader>tt"] = {
			function()
				require("base46").toggle_transparency()
			end,
			"toggle transparency",
		},
		["<leader>at"] = { "<cmd> AerialToggle<CR>, Aerial Toggle" },
		["<leader>an"] = { "<cmd> AerialNext<CR>, Aerial next" },
		["<leader>ap"] = { "<cmd> AerialPrev<CR>, Aerial previous" },

		-- ["<leader>cr"] = {
		-- 	function()
		-- 		local current_file = vim.fn.expand("%")
		-- 		local current_file_directory = vim.fn.expand("%:p:h")
		-- 		local file_name = vim.fn.expand("%:t:r")
		-- 		vim.cmd(
		-- 			"!cd "
		-- 				.. current_file_directory
		-- 				.. " && "
		-- 				.. "clang++ --debug "
		-- 				.. current_file
		-- 				.. " -o "
		-- 				.. file_name
		-- 		)
		-- 		vim.cmd(
		-- 			":vsplit | wincmd < | vertical resize 75 | terminal" .. current_file_directory .. "/" .. file_name
		-- 		)
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
		-- 	end,
		-- 	"Compile and run c++",
		-- },
		-- ["<leader>cR"] = {
		-- 	function()
		-- 		local current_file = vim.fn.expand("%")
		-- 		local current_file_directory = vim.fn.expand("%:p:h")
		-- 		local file_name = vim.fn.expand("%:t:r")
		-- 		vim.cmd(
		-- 			"!cd "
		-- 				.. current_file_directory
		-- 				.. " && "
		-- 				.. "clang --debug "
		-- 				.. current_file
		-- 				.. " -o "
		-- 				.. file_name
		-- 		)
		-- 		vim.cmd(
		-- 			":vsplit | wincmd < | vertical resize 75 | terminal" .. current_file_directory .. "/" .. file_name
		-- 		)
		-- 	end,
		-- 	"Compile and run c",
		--		},
		["<A-H>"] = {
			function()
				local current_file_directory = vim.fn.expand("%:p:h")
				require("nvterm.terminal").send("cd " .. current_file_directory, "horizontal")
				vim.cmd(":wincmd j")
			end,
			"Toggle horizontal term",
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
