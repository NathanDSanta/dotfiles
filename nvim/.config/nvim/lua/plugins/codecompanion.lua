return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			interactions = {
				chat = {
					adapter = {
						name = "ollama",
						model = "qwen3:8b",
					},
				},
				inline = {
					adapter = {
						name = "ollama",
						model = "qwen3:8b",
					},
				},
				cmd = {
					adapter = {
						name = "ollama",
						model = "qwen3:8b",
					},
				},
			},
		},
	},
}
