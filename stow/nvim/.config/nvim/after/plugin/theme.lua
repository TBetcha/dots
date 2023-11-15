-- Default options
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = true,     -- Disable setting background
    terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,    -- Non focused panes set to alternative background
    module_default = true,   -- Default enable value for modules
    colorblind = {
      enable = false,        -- Enable colorblind support
      simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
      severity = {
        protan = 0,          -- Severity [0,1] for protan (red)
        deutan = 0,          -- Severity [0,1] for deutan (green)
        tritan = 0,          -- Severity [0,1] for tritan (blue)
      },
    },
    styles = {               -- Style to be applied to different syntax groups
      comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

vim.cmd("colorscheme nordfox")
-- require("after.plugin.colors")
-- ColorMyPencils(nordfox)

--
local group = vim.api.nvim_create_augroup("marks-fix-hl", {})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = group,
  callback = function()
    vim.api.nvim_set_hl(0, "MarkSignNumHL", {})
  end,
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")

function ColorMyPencils(color)
	color = color or "cattpuccin"
	-- vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='gray', bold=false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#ffe5b4', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='gray', bold=false })
end


ColorMyPencils()
LineNumberColors()
