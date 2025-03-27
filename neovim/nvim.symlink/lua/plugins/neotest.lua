return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "alfaix/neotest-gtest",
    },
    keys = {
      {
        "<leader>tr",
        function()
          require("neotest").run.run({
            suite = false,
            testify = true,
          })
        end,
        desc = "Test: Running Nearest Test",
      },
      {
        "<leader>tv",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Test: Summary Toggle",
      },
      {
        "<leader>ts",
        function()
          require("neotest").run.run({
            suite = true,
            testify = true,
          })
        end,
        desc = "Test: Running Test Suite",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run({
            suite = false,
            testify = true,
            strategy = "dap",
          })
        end,
        desc = "Test: Debug Nearest Test",
      },
      {
        "<leader>to",
        function()
          require("neotest").output.open()
        end,
        desc = "Test: Open test output",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.run(vim.fn.getcwd())
        end,
        desc = "Test: Run all tests in current directory",
      },
    },
    opts = function()
      return {
        adapters = {
          require('rustaceanvim.neotest'),
          require("neotest-gtest").setup({}),
        },
      }
    end,
  },
}
