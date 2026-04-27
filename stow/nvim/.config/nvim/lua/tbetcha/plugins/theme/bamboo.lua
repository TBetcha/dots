return {
  "ribru17/bamboo.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("bamboo").setup({
      transparent = false,
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
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    })
    require("bamboo").load()
  end,
}
