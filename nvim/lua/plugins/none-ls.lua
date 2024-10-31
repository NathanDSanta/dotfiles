return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.astyle,
				null_ls.builtins.formatting.black,
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp", { clear = true }),
			callback = function(args)
				-- 2
				vim.api.nvim_create_autocmd("BufWritePre", {
					-- 3
					buffer = args.buf,
					callback = function()
						-- 4 + 5
						vim.lsp.buf.format({ async = false, id = args.data.client_id })
					end,
				})
			end,
		})

		vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, {})
	end,
}
