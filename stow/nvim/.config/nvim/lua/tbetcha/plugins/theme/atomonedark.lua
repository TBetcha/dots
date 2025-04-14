return {
  'navarasu/onedark.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('onedark').setup {
      style = 'darker',
      transparent = true,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,
      code_style = {
        comments = 'italic',
        keywords = 'italic',
        functions = 'bold',
        strings = 'none',
        variables = 'none'
      },
      -- Lualine options --
      lualine = {
        options = {
          theme = 'onedark'
        },
        transparent = true, -- lualine center bar transparency
      },
      diagnostics = {
        darker = true,
        undercurl = true,
        background = true
      }
    }
  end,
}
