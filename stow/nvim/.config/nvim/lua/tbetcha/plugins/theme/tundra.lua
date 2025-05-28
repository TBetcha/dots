return {
  "sam4llis/nvim-tundra",
  lazy = false,
  priority = 1000,
  config = function()
    require("nvim-tundra").setup({
      transparent_background = true,
      syntax = {
        booleans = { bold = true },
        comments = { italic = true },
        conditionals = { bold = true },
        constants = { bold = true },
        fields = {},
        functions = { italic = true },
        keywords = { italic = true, bold = true },
        loops = {},
        operators = { bold = true },
        punctuation = {},
        strings = {},
        types = { italic = true },
      },
    })
    vim.g.tundra_biome = "jungle"
  end,
}
