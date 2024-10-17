vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("tbetcha")

local dap_status, dap = pcall(require, "dap")
if not dap_status then
  return
end

local dapui_status, dapui = pcall(require, "dapui")
if not dapui_status then
  return
end

vim.loader.enable()

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.fsharp = {
--   install_info = {
--     url = "~/tree-sitter-fsharp",
--     files = {"src/scanner.c", "src/parser.c" }
--   },
--   filetype = "fsharp",
-- }
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.fsharp = {
  install_info = {
    url = "https://github.com/ionide/tree-sitter-fsharp",
    branch = "main",
    files = { "src/scanner.c", "src/parser.c" },
  },
  filetype = "fsharp",
}
