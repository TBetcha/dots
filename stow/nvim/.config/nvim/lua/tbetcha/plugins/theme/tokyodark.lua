return {
  "tiagovla/tokyodark.nvim",
  opts = {
    transparent_background = true,
    styles = {
      comments = { italic = true }, -- style for comments
      keywords = { italic = true }, -- style for keywords
      identifiers = { italic = true }, -- style for identifiers
      functions = { bold = true }, -- style for functions
      variables = { underline = true }, -- style for variables
    },
  },
  config = function(_, opts)
    require("tokyodark").setup(opts) -- calling setup is optional
  end,
}
