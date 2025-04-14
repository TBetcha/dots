return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
  end,

  vim.diagnostic.config({
    virtual_text = false,
  }),
  vim.diagnostic.config({ virtual_lines = { highlight_whole_line = false, only_current_line = true } })

}
