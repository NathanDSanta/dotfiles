return{
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
          },
        },
        ts_ls = {},
        eslint = {},
      },
    },
    config = function(_, opts)
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "eslint", "ts_ls"}
      })


      for server, config in pairs(opts.servers) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end

    end  },
  {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',
  opts = {
    keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<C><leader>"] = { "show" },
			},
    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = true} },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
  },
--  {},
--  {},
}
