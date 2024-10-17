local catppuccin_status, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status then
  return
end

catppuccin.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { },
		loops = {},
		functions = {"bold"},
		keywords = { "italic"},
		strings = {},
		variables = {"bold"},
		numbers = {},
		booleans = {},
		properties = {},
		types = {"underline"},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		barbar = true,
		flash = false,
		treesitter_context = true,
		notify = true,
		mini = false,
		telescope = {
			enabled = true,
			style = "nvchad"
		},
		lsp_trouble = true,
		lsp_saga = true,
		harpoon = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
        mason=true,

		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = { "bold" },
			hints = { "italic" },
			warnings = { "italic" },
			information = { "italic" },
		},
		underlines = {
			errors = { "undercurl" },
			hints = { "undercurl" },
			warnings = { "undercurl" },
			information = { "undercurl" },
		},
		inlay_hints = {
			background = true,
		},
        
	},
})

-- function LineNumberColors()
--     vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='gray', bold=false })
--     vim.api.nvim_set_hl(0, 'LineNr', { fg='#ffe5b4', bold=true })
--     vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='gray', bold=false })
-- end

-- function HarpoonColors()
--     vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
--     vim.cmd('highlight! HarpoonActive guibg=NONE guifg=#eba0ac')
--     vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
--     vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
--     vim.cmd('highlight! TabLineFill guibg=NONE guifg=NONE')
-- end
-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
-- ColorMyPencils("catppuccin")
-- LineNumberColors()
-- HarpoonColors()
