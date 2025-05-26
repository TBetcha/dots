return {
  "ray-x/lsp_signature.nvim",
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded",
    },
    keymaps = function(bufnr)
      vim.keymap.set({ "n" }, "<leader>k", function()
        require("lsp_signature").toggle_float_win()
      end, { silent = true, noremap = true, desc = "toggle signature" })

      vim.keymap.set({ "n" }, "<M-e>", function()
        require("lsp_signature").select_signature_key()
      end, { silent = true, noremap = true, desc = "toggle signature" })
    end,

  },
}
