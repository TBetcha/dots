return {
  "comfysage/aki",
  priority = 1000,
  lazy = false,
  config = function()
    require("aki").setup({
      transparent_background = true,
    })
  end,
}
