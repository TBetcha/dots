-- local vim.keymap = vim.vim.keymap
local map = vim.keymap.set

vim.g.mapleader = " "

-- only used when using netrw
-- map("n", "<leader>e", ":Ex<CR>")

-- allow me to move blocks of text while highlighted - stops at bottom of file and then join does join
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

--stay in visual mode after indentin and indent with only one < or >
map("v", ">", ">gv")
map("v", "<", "<gv")

-- keep cursor in place when joining lines
map("n", "J", "mzJ`z")

-- keep cursor in the middle when jumping to middle of screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-b>", "<C-b>zz")

-- keep cursor in the middle when cycling through search terms
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- beginning and end of line easier...shift sucks
map({"n","v"},"gl","$")
map({"n", "v"},"gh","^")

-- clear highlight
map("n", "qq", "<cmd>:nohl<cr>")
-- when yanked value and pasting over use leader p to delete pasted over value into void register so I don't lose it
map("x", "<leader>p", [["_dP]])

-- use leader Y to yank into system clipboard and y just into nvim
-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- delete into void register
map({ "n", "v" }, "<leader>d", [["_d]])

-- ftw
map("n", "Q", "<nop>")
-- map({"n","i"} ,"<C-c>", "<Esc>")

map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>")

-- start to replace word I'm hovering over
map("n", "<leader>sss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("n", "<leader>cn", "<cmd>cnext<CR>zz")
map("n", "<leader>cp", "<cmd>cprev<CR>zz")
map("n", "<leader>ln", "<cmd>lnext<CR>zz")
map("n", "<leader>lp", "<cmd>lprev<CR>zz")

-- To use `Ctrl+{h,j,k,l}` to navigate windows this part only needed when tmux sucks
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")
--To use `Ctrl+{h,j,k,l}` to navigate windows from any mode incl terminal
map({ "t", "i" }, "<C-h>", "<C-\\><C-N><C-w>h")
map({ "t", "i" }, "<C-j>", "<C-\\><C-N><C-w>j")
map({ "t", "i" }, "<C-k>", "<C-\\><C-N><C-w>k")
map({ "t", "i" }, "<C-l>", "<C-\\><C-N><C-w>l")

-- splits
map("n", "<leader>vs", "<C-w>v") -- split window vertically
map("n", "<leader>hs", "<C-w>s") -- split window horizontally
map("n", "<leader>eq", "<C-w>=") -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>:close<CR>") -- close current split window
--splits-sizes
map("n", "<C-right>", "<cmd>:vert res +5<CR>") -- horizontally larger
map("n", "<C-left>", "<cmd>:vert res -5<CR>") -- horizontal smaller
map("n", "<C-up>", "<cmd>:res +5<CR>") -- vertically taller
map("n", "<C-down>", "<cmd>:res -5<CR>") -- vertically shorter

-- tabs
map("n", "<leader>to", "<cmd>:tabnew<CR>") -- open new tab
map("n", "<leader>tx", "<cmd>:tabclose<CR>") -- close current tab
map("n", "<leader>tn", "<cmd>:tabn<CR>") --  go to next tab
map("n", "<leader>tp", "<cmd>:tabp<CR>") --  go to previous tab

-- buffers
map("n", "<leader>bo", "<cmd>:new<CR>") -- open new buffer
map("n", "<leader>q", "<cmd>:bd<CR>") -- close current buffer
map("n", "<leader>Q", "<cmd>:bd!<CR>") -- close current buffer
map("n", "<S-l>", "<cmd>:bn<CR>") --  go to next buffer
map("n", "<S-h>", "<cmd>:bp<CR>") --  go to previous buffer
map('n', '<leader>,', '<cmd>:bp<CR>') --  go to previous buffer
map('n', '<leader>.', '<cmd>:bn<CR>') --  go to next buffer
map("n", "<leader>w", "<cmd>bp|bd #<CR>") -- close buffer; retain split

-- map <Esc> to exit terminal-mode: >vim
map("t", "<Esc>", "<C-\\><C-n>")

return map
