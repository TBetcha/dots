return {
  "HiPhish/rainbow-delimiters.nvim",
  lazy = false,
  opts = {
    config = function()
      require("rainbow-delimiters.setup").setup({
        -- ...
        strategy = {
          [""] = "rainbow-delimiters.strategy.global",
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        highlight = {
          "RainbowDelimiterViloet",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterRed",
          "RainbowDelimiterCyan",
        },
      })
    end,
  },
}
