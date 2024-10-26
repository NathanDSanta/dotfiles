return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = {
		"HiPhish/rainbow-delimiters.nvim",
	},
	main = "ibl",
	--@module "ibl"
	--@type ibl.config
	config = function()
		require("ibl").setup()
	end,
}
