local material_status, material = pcall(require, "material")
if not material_status then
  return
end

local material_colors_status, colors = pcall(require, "material.colors")
if not material_colors_status then
  return
end

material.setup({
custom_highlights = {
        LineNr = { fg = '#bb58ba' },
        CursorLine = { fg = colors.editor.constrast , underline = true },
      },
 high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = true -- Enable higher contrast text for darker style
    },
  contrast = {
    --     terminal = false, -- Enable contrast for the built-in terminal
    --     sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = true, -- Enable contrast for floating windows
    cursor_line = true, -- Enable darker background for the cursor line
    lsp_virtual_text = true, -- Enable contrasted background for lsp virtual text
    --     non_current_windows = false, -- Enable contrasted background for non-current windows
    --     filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
  },
  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = { italic = true },
    -- strings = { --[[ bold = true ]] },
    keywords = { italic = true },
    functions = { bold = true },
    -- variables = {},
    -- operators = {},
    -- types = {},
  },
  plugins = { -- Uncomment the plugins that you use to highlight them
    --     -- Available plugins:
    --     -- "coc",
    --     -- "colorful-winsep",
    "dap",
    --     -- "dashboard",
    --     -- "eyeliner",
    --     -- "fidget",
    --     -- "flash",
    "gitsigns",
    "harpoon",
    --     -- "hop",
    "illuminate",
    --     "indent-blankline",
    "lspsaga",
    --     -- "mini",
    --     -- "neogit",
    --     -- "neotest",
    --     -- "neo-tree",
    --     -- "neorg",
    "noice",
    "nvim-cmp",
    --     -- "nvim-navic",
    "nvim-tree",
    "nvim-web-devicons",
    --     -- "rainbow-delimiters",
    --     -- "sneak",
    "telescope",
    "trouble",
    --     -- "which-key",
    "nvim-notify",
  },
  disable = {
    -- ... other settings
    background = true,
  },
})
