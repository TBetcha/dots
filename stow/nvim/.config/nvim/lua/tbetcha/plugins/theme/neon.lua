return {
  "rafamadriz/neon",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.neon_style = "doom"
    vim.g.neon_italic_keyword = true
    vim.g.neon_italic_function = true
    vim.g.neon_transparent = true
    vim.g.neon_bold = true
  end,
}
