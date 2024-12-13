return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({
					extra_args = { "--config-path", "/home/nathan/.config/formatters/stylua.toml" },
				}),
				null_ls.builtins.formatting.prettier.with({
					extra_args = { "--config", "/home/nathan/.config/formatters/.prettierrc" },
				}),
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style=file:/home/nathan/.config/formatters/.clang-format" },
				}),
				-- null_ls.builtins.formatting.astyle.with({
				-- 	extra_args = { "--project=~/.config/formatters/.astylerc" },
				-- }),
				null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.dart_format,
        null_ls.builtins.formatting.pretty_php,
			},
		})

		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
		-- 	callback = function(args)
		-- 		vim.api.nvim_create_autocmd("BufWritePre", {
		-- 			buffer = args.buf,
		-- 			callback = function()
		-- 				vim.lsp.buf.format({ async = false, id = args.data.client_id })
		-- 			end,
		-- 		})
		-- 	end,
		-- })
	end,
}
