-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next problem (quickfix)" })
map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous problem (quickfix)" })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next problem (location list)" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous problem (location list)" })
