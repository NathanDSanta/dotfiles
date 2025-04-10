vim.g.mapleader = " "

-- File explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>");

-- Movement
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv", desc = "Move current line up")
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv", desc = "Move current line down")
vim.keymap.set("v", "<M-K>", ":m '<-2<CR>gv=gv", desc = "Move current line up")
vim.keymap.set("v", "<M-J>", ":m '>+1<CR>gv=gv", desc = "Move current line down")

vim.keymap.set("n", "<C-u>", "<C-u>zz", desc = "Keep cursor centered when moving up")
vim.keymap.set("n", "<C-d>", "<C-d>zz", desc = "Keep cursor centerd when moving down")

vim.keymap.set("n", "n", "nzzzv", desc = "Keep cursor centered when going to the next searched value")
vim.keymap.set("n", "N", "Nzzzv", desc = "Keep cursor centered when going to the prev searched value")

vim.keymap.set("n", "J", "mzJ`z", desc = "Keep cursor in place when using J")

-- Deleting, copying and Pasting
vim.keymap.set("n", "x", "\"_x", desc = "Do not copy when deleting a single character with x")

vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", desc = "Copy to system clipboard")


vim.keymap.set("x", "<leader>p", "\"_dP", desc = "Keep the copied value when pasting over another word")

-- Quick Fix navigation
vim.keymap.set("n", "<C-Down>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-Up>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader><Down>", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader><Up>", "<cmd>lprev<CR>zz")



--         _                   _             _  __          _     _           _     
--        | |    ___  __ _  __| | ___ _ __  | |/ /___ _   _| |__ (_)_ __   __| |___ 
--        | |   / _ \/ _` |/ _` |/ _ \ '__| | ' // _ \ | | | '_ \| | '_ \ / _` / __|
--        | |__|  __/ (_| | (_| |  __/ |    | . \  __/ |_| | |_) | | | | | (_| \__ \
--        |_____\___|\__,_|\__,_|\___|_|    |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/
--                                                    |___/                         


--##########
--# DIRECT #
--##########

vim.keymap.set("n", "<leader>Y", "\"+Y", "Copy to system clipboard")
