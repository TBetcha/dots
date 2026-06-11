return {
  "tiagovla/tokyodark.nvim",
  opts = {
    transparent_background = false,
    styles = {
      comments = { italic = true }, -- style for comments
      keywords = {bold = true}, -- style for keywords
      identifiers = { underline = true }, -- style for identifiers
      functions = { italic = true }, -- style for functions
      types = { strikethrough = true }, -- style for functions
      variables = {}, -- style for variables
    },
  },
  config = function(_, opts)
    require("tokyodark").setup(opts) -- calling setup is optional
  end,
}
