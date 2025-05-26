return {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.sonokai_enable_italic = true
    vim.g.sonokai_transparent_background = true
    vim.g.sonokdai_style = 'shusia'
    vim.g.sonokai_diagnostic_text_highlight = true
    vim.g.sonokai_float_styl = 'bright'
    vim.g.sonokai_menu_selection_background = 'green'

    require 'lualine'.setup {
      options = {
        theme = 'sonokai'
      }
    }
  end
}
