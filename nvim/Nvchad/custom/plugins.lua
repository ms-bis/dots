local plugins = {
	{
		"sitiom/nvim-numbertoggle",
		lazy = false,
	},
	{
		"stevearc/dressing.nvim",
		lazy = false,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"ethanholz/nvim-lastplace",
		lazy = false,
		config = function()
			require("nvim-lastplace").setup({})
		end,
	},
	{
		"ThePrimeagen/vim-be-good",
		event = "VeryLazy",
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
			ensure_installed = {
				"codelldb",
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function(_, opts)
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			require("core.utils").load_mappings("dap_python")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		-- ft = "python",
		event = "VeryLazy",
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"RimuhRimu/runthis.nvim",
		event = "VeryLazy",
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
				"cpplint",
				"codelldb",
				"pyright",
				"mypy",
				"ruff",
				"black",
				"debugpy",
				"lua-language-server",
				"selene",
				"stylua",
				"html-lsp",
				"markuplin",
				"prettier",
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = function()
			return require("custom.configs.nvimtree")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "html", "css", "bash", "c", "cpp", "python", "fish", "toml", "lua" },
		},
	},
}

return plugins
