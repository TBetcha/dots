return {
  "vague2k/vague.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vague").setup({
      transparent = false,
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
        strings = "strikethrough",
        variables = "underline",

        -- keywords
        keywords = "bold",
        keyword_return = "italic",
        keywords_loop = "none",
        keywords_label = "none",
        keywords_exception = "underline",

        -- builtin
        builtin_constants = "bold",
        builtin_functions = "italic",
        builtin_types = "bold",
        builtin_variables = "none",

      },
      -- optional configuration here
    })
  end,
}

