return {
	"R-nvim/R.nvim",
	opts = {
		hook = {
			on_filetype = function()
				vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
				vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
			end,
		},
		R_args = { "--quiet", "--no-save" },
	},
}
