return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    local c = require("vscode.colors").get_colors()
    require("vscode").setup({})
  end,
}
