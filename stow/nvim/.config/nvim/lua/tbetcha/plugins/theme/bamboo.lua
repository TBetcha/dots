return {
  "ribru17/bamboo.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("bamboo").setup({
      transparent = true,
      code_style = {
        comments = { italic = true },
        conditionals = {},
        keywords = { italic = true },
        functions = { bold = true },
        namespaces = { italic = true },
        parameters = { underline = true },
        strings = {},
        variables = {},
      },
    })
    require("bamboo").load()
  end,
}
