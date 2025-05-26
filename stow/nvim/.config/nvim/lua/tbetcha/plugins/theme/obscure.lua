return {
  "killitar/obscure.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("obscure").setup({
      styles = {
        functions = { italic = true, bold = true },
        keywords = { italic = true },
        transparent = true,
      }
    })
  end,
}
