return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua", "javascript", "html", "json", "r", "markdown", "python", "typescript" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
		},
	},
}
