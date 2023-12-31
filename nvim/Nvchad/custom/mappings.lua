local M = {}

local function compile_and_run()
	-- local current_file = vim.fn.expand("%")
	local current_file_directory = vim.fn.expand("%:p:h") -- current file directory
	local file_name = vim.fn.expand("%:t:r") -- current file name without extension
	local file_name_exe = vim.fn.expand("%:t") -- cureent file name with .exetension

	vim.cmd(":w")

	if vim.bo.filetype == "c" then
		vim.cmd(
			":split | wincmd < | horizontal resize 12 | terminal"
				.. "!cd "
				.. current_file_directory
				.. " && clang --debug "
				.. file_name_exe
				.. " -o "
				.. file_name
				.. " -lm && "
				.. current_file_directory
				.. "/"
				.. file_name
		)
	elseif vim.bo.filetype == "cpp" then
		vim.cmd(
			":split | wincmd < | horizontal resize 12 | terminal"
				.. "!cd "
				.. current_file_directory
				.. " && clang++ --debug "
				.. file_name_exe
				.. " -o "
				.. file_name
				.. " && "
				.. current_file_directory
				.. "/"
				.. file_name
		)
	elseif vim.bo.filetype == "python" then
		vim.cmd(
			":split | wincmd < | horizontal resize 12 | terminal"
				.. "!cd "
				.. current_file_directory
				.. " && python "
				.. file_name_exe
		)
	elseif vim.bo.filetype == "html" then
		vim.cmd(":LiveServerStart")
	else
		print("Unsupported file type for compilation and running.")
		return
	end
end

-- Autocommands to set filetypes for C and C++ files
vim.cmd([[
    augroup NvchadFileType
        autocmd!
        autocmd BufNewFile,BufRead *.c set filetype=c
        autocmd BufNewFile,BufRead *.cpp set filetype=cpp
        autocmd BufNewFile,BufRead *.py set filetype=python
        autocmd BufNewFile,BufRead *.html set filetype=html
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
		["<leader>tc"] = {
			function()
				local current_file_directory = vim.fn.expand("%:p:h")
				require("nvterm.terminal").send("cd " .. current_file_directory, "horizontal")
				vim.cmd(":wincmd j")
			end,
			"Toggle terminal to current files directory",
		},
		["<leader>tp"] = {
			function()
				require("telescope").extensions.projects.projects({})
			end,
			"Telescope projects",
		},
		["<leader>tb"] = {
			function()
				require("telescope").extensions.file_browser.file_browser({})
			end,
			"Telescope file browser",
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
