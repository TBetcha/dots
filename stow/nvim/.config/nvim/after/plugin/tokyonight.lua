local tokyonight_status, tokyonight = pcall(require, "tokyonight")
if not tokyonight_status then
  return
end

local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
  return
end

tokyonight.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
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
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  -- on_highlights = function(highlights, colors) end,
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

plugins =
  {
    -- telescope = true,
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
})
  -- Lua
  lualine.setup({
    options = {
      -- ... your lualine config
      theme = "tokyonight",
      -- ... your lualine config
    },
  })

vim.cmd("colorscheme tokyonight")
