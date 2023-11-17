local harpoon_status, harpoon = pcall(require, "harpoon")
if not harpoon_status then
    return
end


local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local tmux =require("harpoon.tmux")
local term =require("harpoon.term")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end)
vim.keymap.set("n", "<leader>t1", function() tmux.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>t2", function() tmux.gotoTerminal(2) end)
vim.keymap.set("n", "<leader>t0", function() term.gotoTerminal(1) end)


--
--Cattpuccin colors
-- vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
-- vim.cmd('highlight! HarpoonActive guibg=NONE guifg=#eba0ac')
-- vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
-- vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
-- vim.cmd('highlight! TabLineFill guibg=NONE guifg=NONE')

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=#E06C75')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#61AFEF')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#E5C07B')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=NONE')
--
harpoon.setup({
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = true,
    tabline_prefix = " =>> ",
    tabline_suffix = " |",
})
