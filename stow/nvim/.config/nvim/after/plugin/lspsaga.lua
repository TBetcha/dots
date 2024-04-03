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
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    colors = {
      normal_bg = "#022746",
    },
  },
  winbar = {
      color_mode = true,
  },
    diagnostic = {
        max_height = 0.8,
        keys = {
            quit = {'q', '<ESC>'}
        },
        extend_relatedInformation = true
    },
  finder = {
    max_height = 0.6,
    right_width = 0.5,
    keys = {
      vsplit = 'v'
    }
  },
  code_action = {
      extend_gitsigns = true,
        keys = {
            quit = {'q', '<ESC>'}
        },
  },
  rename = {
      auto_save = true
  }
})
