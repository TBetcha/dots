return {
  "dgox16/oldworld.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("oldworld").setup({
      variant = "oled",
      styles = {
        booleans = { bold = true },
        keywords = {italic = true},
        functions = {italic=true, bold=true}
      },
      integrations = {
        telescope = true,
        cmp = true,
        gitsigns = true,
        markdown=true,
        noice=true,
        treesitter=true,
        lsp=true,
        notify=true,
      },
    })
  end,
}
