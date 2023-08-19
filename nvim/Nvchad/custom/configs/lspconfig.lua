local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
					[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
	},
})

-- lspconfig.yamlls.setup({
-- 	settings = {
-- 		yaml = {
-- 			schemas = {
-- 				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
-- 				["../path/relative/to/file.yml"] = "/.github/workflows/*",
-- 				["/path/from/root/of/project"] = "/.github/workflows/*",
-- 			},
-- 		},
-- 	},
-- })
