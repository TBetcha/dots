return {
  "loctvl842/monokai-pro.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("monokai-pro").setup({
      background_clear = { "float_win" },
      transparent_background = true,
      terminal_colors = true,
      devicons = true, -- highlight the icons of `nvim-web-devicons`
      styles = {
        comment = { italic = true },
        keyword = { underline = true }, -- any other keyword
        type = { bold = true }, -- (preferred) int, long, char, etc
        storageclass = { italic = false }, -- static, register, volatile, etc
        structure = { italic = false }, -- struct, union, enum, etc
        parameter = { italic = true }, -- parameter pass in function
        annotation = { italic = true },
        tag_attribute = { italic = true }, -- attribute of tag in reactjs
      },
      -- Your config here
    })
  end,
}
