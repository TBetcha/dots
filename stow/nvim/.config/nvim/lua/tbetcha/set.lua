local opt = vim.opt

-- netrw
-- -- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- scrolling, columns, & other display stuff
opt.termguicolors = true
opt.nu = true
opt.relativenumber = true
opt.colorcolumn = "100"
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.wrap = false
opt.splitright = true
opt.splitbelow = true
opt.equalalways = true
opt.showmode = false -- pfft
opt.showcmd = true -- show cmd I ran
opt.cmdheight = 2 -- height of cmd bar
opt.showmatch = true -- show matching bracket when text indicator is over them
opt.splitkeep = "screen"
opt.showtabline = 2
opt.foldmethod = "marker"
opt.cursorline = true

-- use spaces instead of tabs, set 4 spaces on indent, smart indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
-- Format options meaning
-- - "a" -- I'll take the wheel, no formatting for you
-- - "t" -- Seriously, Don't auto format my code.
-- + "c" -- In general, I like it when comments respect textwidth
-- + "q" -- Allow formatting comments w/ gq
-- - "o" -- O and o, don't continue comments
-- - "r" -- don't continue when pressing enter.
-- + "n" -- Indent past the formatlistpat, not underneath it.
-- + "j" -- Auto-remove comments if possible.
-- - "2"
-- vim.cmd("autocmd BufEnter * set formatoptions-=actro")
-- vim.cmd("autocmd BufEnter * setlocal formatoptions-=actro")

opt.formatoptions = opt.formatoptions
  - "a"
  - "t"
  + "c"
  + "q"
  - "o"
  + "r"
  + "n"
  + "j"
  - "2"

-- undo stuff, buffers & files
opt.swapfile = false
opt.backup = false --  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.undodir = os.getenv("HOME") .. "/.undonvim"
opt.undofile = true
opt.hidden = true

-- searching
opt.hlsearch = true
opt.incsearch = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true

-- faster completions
opt.updatetime = 1000

-- Show command options on the bottom when pressing tab
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.pumblend = 17
opt.wildoptions = "pum"

-- [[ Highlight on yank ]] See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- null-ls fomratting timeout was not long enough
return {
	lsp = {
		formatting = {
			timeout_ms = 7000,
		},
	},
},
	-- When using `dd` in the quickfix list, remove the item from the quickfix list.
	vim.cmd([[
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>
]])



