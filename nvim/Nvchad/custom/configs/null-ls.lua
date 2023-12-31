local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
	sources = {
		-- c & c++
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.diagnostics.cpplint,
		-- python
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.ruff,
		-- lua
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.selene,
		-- null_ls.builtins.diagnostics.luacheck,
		null_ls.builtins.completion.spell,
		-- html
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.markuplint,
		-- yaml
		null_ls.builtins.formatting.prettier,
		-- null_ls.builtins.diagnostics.yamllint,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
}

return opts
