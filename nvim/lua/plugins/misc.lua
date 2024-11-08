-- Standalone plugins with less than 10 lines of config go here
return {
	{
		-- Tmux & split window navigation
		"christoomey/vim-tmux-navigator",
	},
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		-- Hints keybinds
		"folke/which-key.nvim",
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.animate").setup()
			require("mini.move").setup()
		end,
	},
	{
		"giusgad/pets.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
		config = function()
			require("pets").setup({
				row = 5,                 -- the row (height) to display the pet at (higher row means the pet is lower on the screen), must be 1<=row<=10
				col = -15,               -- the column to display the pet at (set to high number to have it stay still on the right side)
				speed_multiplier = 1,    -- you can make your pet move faster/slower. If slower the animation will have lower fps.
				default_pet = "dog",     -- the pet to use for the PetNew command
				default_style = "black", -- the style of the pet to use for the PetNew command
				random = false,          -- whether to use a random pet for the PetNew command, overrides default_pet and default_style
				death_animation = true,  -- animate the pet's death, set to false to feel less guilt -- currently no animations are available
				popup = {                -- popup options, try changing these if you see a rectangle around the pets
					width = "30%",         -- can be a string with percentage like "45%" or a number of columns like 45
					winblend = 100,        -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
					hl = { Normal = "Normal" }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
					avoid_statusline = false, -- if winblend is 100 then the popup is invisible and covers the statusline, if that
					-- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
				},
			})
		end,
	},
}
