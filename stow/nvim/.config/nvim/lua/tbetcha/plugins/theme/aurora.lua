return {
  "ray-x/aurora",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  init = function()
    vim.g.aurora_italic = 1
    vim.g.aurora_transparent = 1
    vim.g.aurora_bold = 1
  end,
  config = function()
    -- override defaults
    vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
  end,
}
