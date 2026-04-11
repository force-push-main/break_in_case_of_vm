require("config.lazy")


local opt = vim.opt
local keymap = vim.keymap
local strudel = require("strudel")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true

-- Indenting
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- Line numbers
opt.nu = true
opt.relativenumber = true

-- General settings
opt.cursorline = true
opt.guicursor = "n:ver25,i:ver25-blinkon250-blinkoff250-blinkwait0"

-- Keybindings
keymap.set("i", "jj", "<Esc>")
keymap.set("n", "K", ":m-2<CR>")
keymap.set("n", "J", ":m+1<CR>")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--test line 1
--test line 2
--Strudel
vim.keymap.set("n", "<leader>sl", strudel.launch, { desc = "Launch Strudel" })
vim.keymap.set("n", "<leader>sq", strudel.quit, { desc = "Quit Strudel" })
vim.keymap.set("n", "<leader>st", strudel.toggle, { desc = "Strudel Toggle Play/Stop" })
vim.keymap.set("n", "<leader>su", strudel.update, { desc = "Strudel Update" })
vim.keymap.set("n", "<leader>ss", strudel.stop, { desc = "Strudel Stop Playback" })
vim.keymap.set("n", "<leader>sb", strudel.set_buffer, { desc = "Strudel set current buffer" })
vim.keymap.set("n", "<leader>sx", strudel.execute, { desc = "Strudel set current buffer and update" })

