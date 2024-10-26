return {
	"natecraddock/workspaces.nvim",
	config = function()
		require("workspaces").setup({
			hooks = {
				open = "Neotree reveal left",
			},
		})
	end,
}
