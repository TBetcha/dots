return{
 "lewpoly/sherbet.nvim",
lazy = false,
priority = 1000,
config = function()
  vim.g.sherbet_italic_keywords = true
vim.g.sherbet_italic_functions = true
vim.g.sherbet_italic_comments = true
vim.g.sherbet_italic_loops = true
vim.g.sherbet_italic_conditionals = false
end,
}
