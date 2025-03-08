return {
  "rmehri01/onenord.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("onenord").setup({
      styles = {
        comments = "italic",
        strings = "none",
        keywords = "italic",
        functions = "bold",
        variables = "none",
        diagnostics = "underline",
      },
    })
  end,
}
