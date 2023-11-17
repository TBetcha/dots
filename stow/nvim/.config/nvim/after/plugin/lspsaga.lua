-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  -- keybinds for navigation in lspsaga window
  scroll_preview = { scroll_down = "<C-d>", scroll_up = "<C-u>" },
  -- use enter to open file with definition preview
  definition = {
    edit = "<CR>",
  },
  ui = {
        -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    colors = {
      normal_bg = "#022746",
    },
  },
  winbar = {
      color_mode = true,
  }
})
