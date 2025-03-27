return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    keys = {
      {
        "<F8>",
        function()
          require("dap").continue()
        end,
        desc = "Debug: Continue",
      },
      {
        "<S-F8>",
        function()
          require("dap").restart()
        end,
        desc = "Debug: Restart",
      },
      {
        "<F9>",
        function()
          require("dap").terminate()
        end,
        desc = "Debug: Terminate",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Debug: Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Debug: Step Into",
      },
      {
        "<S-F11>",
        function()
          require("dap").step_out()
        end,
        desc = "Debug: Step Out",
      },
      {
        "<leader>b",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Debug: Toggle Breakpoint",
      },
      {
        "<leader>B",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Debug: Set Conditional Breakpoint",
      },
    },
  },

  -- Provides an nice interface for debugging
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = true,
    init = function()
      local dapui = require("dapui")
      local dap = require("dap")
      dap.listeners.before.attach["dapui_config"] = dapui.open
      dap.listeners.before.launch["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close
    end,
    keys = {
      {
        "<M-k>",
        function()
          require("dapui").eval()
        end,
        mode = { "n", "v" },
        desc = "Debug: Evaluate expression under cursor or highlighted",
      },
    },
  },

  -- Bridges 'mason' and 'nvim-dap' plugins to install and manage debug adapters.
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
      "neovim/nvim-lspconfig",
    },
    opts = {
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    },
  },
}
