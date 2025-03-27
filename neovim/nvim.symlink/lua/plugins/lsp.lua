return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "j-hui/fidget.nvim",
    },
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
        callback = function(event)
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
          end, vim.tbl_extend("force", opts, { desc = "LSP: Jump to definition" }))
          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
          end, vim.tbl_extend(
            "force",
            opts,
            { desc = "LSP: Help for symbol under cursor" }
          ))
          vim.keymap.set("n", "<leader>vws", function()
            vim.lsp.buf.workspace_symbol()
          end, vim.tbl_extend("force", opts, { desc = "LSP: Search workspace symbols" }))
          vim.keymap.set("n", "<leader>vd", function()
            vim.diagnostic.open_float()
          end, vim.tbl_extend("force", opts, { desc = "LSP: Open diagnostic" }))
          vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_next()
          end, vim.tbl_extend("force", opts, { desc = "LSP: Next diagnostic" }))
          vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_prev()
          end, vim.tbl_extend("force", opts, { desc = "LSP: Previous diagnostic" }))
          vim.keymap.set("n", "<leader>vca", function()
            vim.lsp.buf.code_action()
          end, vim.tbl_extend("force", opts, { desc = "LSP: Code action" }))
          vim.keymap.set("n", "<leader>vrr", function()
            vim.lsp.buf.references()
          end, vim.tbl_extend("force", opts, { desc = "LSP: Find references" }))
          vim.keymap.set("n", "<leader>vrn", function()
            vim.lsp.buf.rename()
          end, vim.tbl_extend("force", opts, { desc = "LSP: Rename symbol" }))
          vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
          end, vim.tbl_extend("force", opts, { desc = "LSP: Signature help" }))
        end,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = function()
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      local lspconfig = require("lspconfig")
      return {
        handlers = {
          function(server_name) -- default handler (optional)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
        },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip", -- snippets
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      return {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      }
    end,
  },
  -- Notifications for LSP
  {
    "j-hui/fidget.nvim",
    config = true,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
      },
    },
  },
}
