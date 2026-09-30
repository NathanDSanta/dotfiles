-- Extra navigation
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", { desc = "Move current line up" })
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", { desc = "Move current line down" })
vim.keymap.set("v", "<M-K>", ":m '<-2<CR>gv=gv", { desc = "Move current line up" })
vim.keymap.set("v", "<M-J>", ":m '>+1<CR>gv=gv", { desc = "Move current line down" })

vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Keeping the cursor centered
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor centered when moving up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor centerd when moving down" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Keep cursor centered when going to the next searched value" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep cursor centered when going to the prev searched value" })

-- Save and quit current file quicker
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = false, desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { silent = false, desc = "Quit file" })

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy selection to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })

-- Paste without replacing paste with what you are highlighted over
vim.keymap.set("n", "<leader>p", '"_dP', { desc = "Keep the copied value when pasting over another word" })

-- Buffer
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>h", ":hsplit<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>be", ":enew<CR>", { desc = "New Buffer" })
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bc", ":bd<CR>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bs", ":saveas", { desc = "Save Buffer As" })

vim.keymap.set({ "n", "v" }, "<leader>bf", ":BufferFormat<CR>", { desc = "Format buffer" })

-- Oil File Explorer
vim.keymap.set("n", "<leader>oo", ":Oil<CR>", { desc = "Open Oil File Explorer" })
vim.keymap.set("n", "<leader>of", ":Oil --float<CR>", { desc = "Open Oil Float" })

-- Noice Notifications Message
vim.keymap.set("n", "<C-k>", ":NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

vim.api.nvim_create_autocmd(
	"LspAttach",
	{ --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)

			-- Open the diagnostic under the cursor in a float window
			vim.keymap.set("n", "<leader>d", function()
				vim.diagnostic.open_float({
					border = "rounded",
				})
			end, opts)
		end,
	}
)
