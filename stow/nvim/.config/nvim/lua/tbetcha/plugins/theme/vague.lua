return {
  "vague2k/vague.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vague").setup({
      transparent = true,
      bold = true,
      italic = true,
      style = {
        boolean = "bold",
        number = "none",
        float = "none",
        error = "bold",
        comments = "italic",
        conditionals = "none",
        functions = "italic",
        headings = "bold",
        operators = "none",
        strings = "italic",
        variables = "none",

        -- keywords
        keywords = "bold",
        keyword_return = "italic",
        keywords_loop = "none",
        keywords_label = "none",
        keywords_exception = "none",

        -- builtin
        builtin_constants = "bold",
        builtin_functions = "none",
        builtin_types = "bold",
        builtin_variables = "none",

      },
      -- optional configuration here
    })
  end,
}

