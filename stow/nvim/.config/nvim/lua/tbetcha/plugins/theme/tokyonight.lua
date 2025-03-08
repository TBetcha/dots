return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  -- opts = {
  config = function()
    require("tokyonight").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      on_highlights = function(hl, c)
        -- hl.Normal = "Foo"
        do
          return
        end
        local prompt = "#2d3149"
        hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg }
        hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePromptNormal = { bg = prompt }
        hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
        hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
        hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
      end,
      plugins = {
        telescope = true,
        cmp = true,
        copilot = true,
        dap = true,
        gitsigns = true,
        illuminate = true,
        lazy = true,
        lspsaga = true,
        noice = true,
        notify = true,
        -- nvim-tree=true,
        octo = true,
        trouble = true,
      },
      -- -- Lua
      -- require("lualine").setup({
      --   options = {
      --     -- ... your lualine config
      --     theme = "tokyonight",
      --     -- ... your lualine config
      --   },
      -- }),
    })
    vim.cmd("colorscheme tokyonight")
  end,
}
