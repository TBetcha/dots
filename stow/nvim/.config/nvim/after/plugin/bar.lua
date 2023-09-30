
local barbar_status, bar = pcall(require, "barbar")
if not barbar_status then
  return
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
-- map('n', '<leader>,', '<Cmd>BufferPrevious<CR>', opts)
-- map('n', '<leader>.', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
-- map('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', opts)
-- map('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position... 
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<leader>pn', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', 'QT', '<Cmd>BufferClose<CR>', opts)
map('n', '<F12>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
map('n', '<A-a>', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Sort automatically by...
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
--

require'barbar'.setup {
	icons = {
		-- Configure the base icons on the bufferline.
		-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
		buffer_index = true,
		buffer_number = false,
		button = '',
		-- Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
			[vim.diagnostic.severity.WARN] = {enabled = false, icon = ' '},
			[vim.diagnostic.severity.INFO] = {enabled = false, icon = ' '},
			[vim.diagnostic.severity.HINT] = {enabled = false, icon = '⚑ '},
		},
		gitsigns = {
			added = {enabled = true, icon = '+'},
			changed = {enabled = true, icon = '~'},
			deleted = {enabled = true, icon = '-'},
		},
		sidebar_filetypes = {
			-- Use the default values: {event = 'BufWinLeave', text = nil}
			 NvimTree = true,
			-- Or, specify the text used for the offset:
			undotree = {text = 'undotree'},
		},
		-- New buffer letters are assigned in this order. This order is
		-- optimal for the qwerty keyboard layout but might need adjustment
		-- for other layouts.
		letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

	}
}
