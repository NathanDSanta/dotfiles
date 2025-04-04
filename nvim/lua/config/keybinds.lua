-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true})

-- For conciseness
local opts = { noremap = true, silent = true}

-- save file
opts["desc"] = "Save"
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
opts["desc"] = "Save without formatting"
vim.keymap.set("n", "<leader>ws", "<cmd>noautocmd w <CR>", opts)

-- quit file
opts["desc"] = "Quit"
vim.keymap.set({ "n", "v", "i" }, "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
opts["desc"] = "Delete character wo saving to register"
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
opts["desc"] = "Scroll Down"
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
opts["desc"] = "Scroll Up"
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
opts["desc"] = "Find next"
vim.keymap.set("n", "n", "nzzzv", opts)
opts["desc"] = "Find previous"
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
-- opts["desc"] = "Resize Up"
-- vim.keymap.set("n", "<Up>", ":resize +2<CR>", opts)
-- opts["desc"] = "Resize Down"
-- vim.keymap.set("n", "<Down>", ":resize -2<CR>", opts)
-- opts["desc"] = "Resize Left"
-- vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", opts)
-- opts["desc"] = "Resize Right"
-- vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", opts)

-- Buffers
opts["desc"] = "Next buffer"
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
opts["desc"] = "Previous buffer"
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
opts["desc"] = "Delete current buffer"
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", opts)   -- close buffer
opts["desc"] = "New buffer"
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
opts["desc"] = "Vertical Split"
vim.keymap.set("n", "<leader>v", "<C-w>v", opts)      -- split window vertically
opts["desc"] = "Horizontal Split"
vim.keymap.set("n", "<leader>h", "<C-w>s", opts)      -- split window horizontally
opts["desc"] = "Equalize window sizes"
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)     -- make split windows equal width & height
opts["desc"] = "Close current split window"
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
opts["desc"] = "Switch split up"
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
opts["desc"] = "Switch split down"
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
opts["desc"] = "Switch split left"
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
opts["desc"] = "Switch split right"
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
opts["desc"] = "New tab"
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)   -- open new tab
opts["desc"] = "Close current tab"
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
opts["desc"] = "Next tab"
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)     --  go to next tab
opts["desc"] = "Previous tab"
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)     --  go to previous tab

-- Toggle line wrapping
opts["desc"] = "Toggle line wrapping"
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
opts["desc"] = "Indent inwards"
vim.keymap.set("v", "<Tab>", ">gv", opts)
opts["desc"] = "Indent outwards"
vim.keymap.set("v", "<S-Tab>", "<gv", opts)

-- Keep last yanked when pasting
opts["desc"] = "Keep last yanked when pasting"
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
opts["desc"] = "Next diagnostic message"
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
opts["desc"] = "Previous diagnostic message"
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
opts["desc"] = "Open floating diagnostic message"
vim.keymap.set("n", "<leader>dm", vim.diagnostic.open_float, opts)
opts["desc"] = "Open diagnostics list"
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, opts)

-- sshfs
local remoteApi = require('remote-sshfs.api')
local remoteConnections = require("remote-sshfs.connections")
vim.keymap.set('n', '<leader>rc', remoteApi.connect, {})
vim.keymap.set('n', '<leader>rd', remoteApi.disconnect, {})
vim.keymap.set('n', '<leader>re', remoteApi.edit, {})

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>wk", "<cmd> Telescope workspaces <CR>", { desc = "Open Workspace List" })
vim.keymap.set("n", "<leader>fc", "<cmd> Telescope flutter commands <CR>", { desc = "Open Flutter Commands List" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

-- Debugging
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>db", function()
	require("dap").toggle_breakpoint()
end)

--Lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Make it rain
vim.keymap.set("n", "<leader>mkr", "<cmd>CellularAutomaton make_it_rain<CR>")

--Writing
vim.keymap.set("n", "<leader>zm", "<cmd>ZenMode | PencilToggle", { desc = "Toggle ZenMode" })
vim.keymap.set("n", "<leader>zt", "<cmd>Twilight<CR>", { desc = "Toggle Twilight" })

--Comment
vim.keymap.set("n", "<C-_>", require("Comment.api").toggle.linewise.current, opts)
vim.keymap.set("n", "<C-c>", require("Comment.api").toggle.linewise.current, opts)
vim.keymap.set("n", "<C-/>", require("Comment.api").toggle.linewise.current, opts)
vim.keymap.set("v", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
vim.keymap.set("v", "<C-c>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
vim.keymap.set("v", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)

--Neotree
vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
vim.keymap.set("n", "<leader>e", ":Neotree toggle position=left<CR>", opts) -- focus file explorer
vim.keymap.set("n", "<leader>gl", ":Neotree git_status position=left<CR>", opts) -- focus git status
vim.keymap.set("n", "<leader>ngs", ":Neotree float git_status<CR>", opts)   -- open git status window

--None-ls
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, {})

-- Cmake
vim.keymap.set("n", "<leader>cbc", "<cmd>!cmake -B build<CR>", {})
vim.keymap.set("n", "<leader>cbb", "<cmd>!cmake --build build<CR>", {})

-- Slint
vim.keymap.set("n", "<leader>sv", "<cmd>!slint-viewer %<CR>", {})
