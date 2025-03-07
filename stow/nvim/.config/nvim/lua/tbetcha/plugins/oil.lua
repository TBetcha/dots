return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
      win_opts = {
        signcolumn = "yes",
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          return name == ".." or name == ".git"
        end,
      },
    })
    vim.keymap.set("n", "-", oil.toggle_float, {})
  end,
}
