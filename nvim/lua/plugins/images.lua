return {
	{
		"3rd/image.nvim",
		config = function()
			require("image").setup()
		end
	},
	{
		{ 'krivahtoo/silicon.nvim', run = './install.sh' }
	}
}
