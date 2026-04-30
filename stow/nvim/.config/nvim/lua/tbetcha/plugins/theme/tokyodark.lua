return {
  "tiagovla/tokyodark.nvim",
  opts = {
    transparent_background = false,
    styles = {
      comments = { italic = true }, -- style for comments
      keywords = {}, -- style for keywords
      identifiers = { strikethrough = true }, -- style for identifiers
      functions = { italic = true }, -- style for functions
      types = { underline = true }, -- style for functions
      variables = {}, -- style for variables
    },
  },
  config = function(_, opts)
    require("tokyodark").setup(opts) -- calling setup is optional
  end,
}
