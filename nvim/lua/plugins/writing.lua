return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			vim.keymap.set("n", "<leader>zm", "<cmd>ZenMode | PencilToggle", { desc = "Toggle ZenMode" })
		end,
	},
	{
		"folke/twilight.nvim",
		config = function()
			vim.keymap.set("n", "<leader>zt", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })
		end,
	},
	{ "preservim/vim-pencil" },
	{
		"arminveres/md-pdf.nvim",
		branch = "main", -- you can assume that main is somewhat stable until releases will be made
		lazy = true,
		keys = {
			{
				"<leader>,",
				function()
					require("md-pdf").convert_md_to_pdf()
				end,
				desc = "Markdown preview",
			},
		},
		opts = {},
	},
}
