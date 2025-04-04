return
  {"nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
	local config = require("nvim-treesitter.configs")
	config.setup({
    auto_install = true;
	  highlight = {enable = false},
	  indent = {enable = true},
	})
    end
  }
