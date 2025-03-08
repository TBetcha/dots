return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  lazy = false,
  config = function()
    require("rose-pine").setup({
      variant = "moon", -- auto, main, moon, or dawn
      dark_variant = "moon", -- main, moon, or dawn
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    })
  end,
}
