vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Cut to blackhole then paste before cursor" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Cut to blackhole" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next problem (quickfix)" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous problem (quickfix)" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next problem (location list)" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous problem (location list)" })
