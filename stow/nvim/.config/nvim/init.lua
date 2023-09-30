require("tbetcha")

vim.loader.enable()

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.fsharp = {
  install_info = {
    url = "~/tree-sitter-fsharp",
    files = {"src/scanner.cc", "src/parser.c" }
  },
  filetype = "fsharp",
}
