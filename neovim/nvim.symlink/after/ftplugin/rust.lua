local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>ca", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
end, { desc = "Rust: Code action", silent = true, buffer = bufnr })
vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({ "hover", "actions" })
  end,
  { desc = "Rust: hover action", silent = true, buffer = bufnr }
)
