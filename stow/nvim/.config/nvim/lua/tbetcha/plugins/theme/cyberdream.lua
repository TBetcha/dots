return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      variant = "default",
      transparent = true,
      italic_coments = true,
      saturation = 0.8,
      highlights = {
        Function = { fg = "#5ea1ff", bg = "NONE", italic = true, bold = true },
      },
      extensions = {
        telescope = true,
        notify = true,
        noice = true,
        cmp = true,
        lazy = true,
        gitsigns = true,
        treesitter = true,
        treesittercontext = true,
        trouble = true,
      },
    })
  end,
}
