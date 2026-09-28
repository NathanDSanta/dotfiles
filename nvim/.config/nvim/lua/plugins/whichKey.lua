return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 0,
		icons = {
			mappings = true,
		},
	},
	spec = {
		--{ "<leader>l", group = "[L]sp" },
		--{ "<leader>t", group = "[T]elescope" },
		{ "<leader>O", group = "[O]il" },
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true, preset = "modern" })
			end,
			desc = "Keymaps",
		},
	},
}