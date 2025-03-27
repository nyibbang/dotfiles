return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key",
          },
        },
      },
    },
    keys = {
      {
        "<leader>pf",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Telescope: find files",
      },
      {
        "<C-p>",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "Telescope: find Git files",
      },
      {
        "<leader>pb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Telescope: find buffers",
      },
      {
        "<leader>pws",
        function()
          local word = vim.fn.expand("<cword>")
          require("telescope.builtin").grep_string({ search = word })
        end,
        desc = "Telescope: grep word under cursor",
      },
      {
        "<leader>pWs",
        function()
          local word = vim.fn.expand("<cWORD>")
          require("telescope.builtin").grep_string({ search = word })
        end,
        desc = "Telescope: grep WORD under cursor",
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Telescope: live grep",
      },
      {
        "<leader>ph",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Telescope: find in help",
      },
    },
  },
}
