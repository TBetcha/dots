return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    highlight = {
      -- HACK: setting to false so fsharp will work correctly
      comments_only = false, -- uses treesitter to match keywords in comments only
      exclude = { "proto" },
    },
    keys = {

      vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" }),
      vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" }),
      vim.keymap.set("n", "<leader>xt", ":TodoTrouble<CR>"),
      vim.keymap.set("n", "<leader>tdt", ":TodoTelescope<CR>"),
      vim.keymap.set("n", "<leader>tqf", "<cmd>:TodoQuickFix<CR>"),
    }
  },
}
