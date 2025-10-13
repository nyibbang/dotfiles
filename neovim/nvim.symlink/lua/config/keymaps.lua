-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

map("x", "<leader>p", '"_dP', { desc = "Cut to blackhole then paste before cursor" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy line to clipboard" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Cut to blackhole" })

map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next problem (quickfix)" })
map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous problem (quickfix)" })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next problem (location list)" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous problem (location list)" })
