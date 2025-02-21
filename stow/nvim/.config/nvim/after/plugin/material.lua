local material_status, material = pcall(require, "material")
if not material_status then
  return
end

material.setup({

  contrast = {
    --     terminal = false, -- Enable contrast for the built-in terminal
    --     sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    cursor_line = false, -- Enable darker background for the cursor line
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
