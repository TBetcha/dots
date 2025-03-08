return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  lazy = false,
  config = function()
    opts = {
      styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "italic",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "italic",
        virtual_text = "NONE",
      },
      options = {
        cursorline = false, -- Use cursorline highlighting?
        transparency = true, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
      },
    }

    local group = vim.api.nvim_create_augroup("marks-fix-hl", {})
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      group = group,
      callback = function()
        vim.api.nvim_set_hl(0, "MarkSignNumHL", {})
      end,
    })
  end,
}
