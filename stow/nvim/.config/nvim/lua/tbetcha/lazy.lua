-- This  file can be loaded by calling `lua require('plugins')` from your init.vimlazy

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
require("lazy").setup({

  { import = "tbetcha.plugins" },
  { import = "tbetcha.plugins.lsp" },
  { import = "tbetcha.plugins.ui" },
  { import = "tbetcha.plugins.theme" },
  -- tmux nav
  "christoomey/vim-tmux-navigator",

  ---------------------------------------
  --------------- THEMES  ---------------
  ---------------------------------------

  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- Ensure it loads first
    lazy = false,
  },
  {
    "sainnhe/gruvbox-material",
    priority = 1000, -- Ensure it loads first
    lazy = false,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    lazy = false,
  },
  {
    "NAlexPear/Spacegray.nvim",
    priority = 1000,
    lazy = false,
  },

  ---------------------------------------
  -------------- LSP & ISH  -------------
  ---------------------------------------
  { "ray-x/cmp-treesitter" },
  -- snippet engine
  "L3MON4D3/LuaSnip",
  -- for autocompletion
  "saadparwaiz1/cmp_luasnip",
  -- useful snippets
  "rafamadriz/friendly-snippets",
  "jose-elias-alvarez/typescript.nvim",
  { "onsails/lspkind.nvim" },
  { "glepnir/lspsaga.nvim" },

  --END OF LSP STUFF
  { "nvim-telescope/telescope.nvim",            version = "0.1.4" },
  -- fzf searching for telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  -- zoxide telescope extension
  "jvgrootveld/telescope-zoxide",
  -- required for zoxide ext
  "nvim-lua/popup.nvim",
  --commenting
  { "numToStr/Comment.nvim" },
  -- language parser
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- show parsing of language elements live
  "nvim-treesitter/playground",
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  --fast switching of buffers
  {
    "theprimeagen/harpoon",
  },
  -- long lived undos
  "mbbill/undotree",
  -- git integration
  "tpope/vim-fugitive",
  -- surround motions
  "tpope/vim-surround",
  -- icons
  -- "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  -- git icons
  -- bar to show buffers
  -- "romgrk/barbar.nvim",
  -- --------------------------
  -- file explorer
  -- "nvim-tree/nvim-tree.lua",
  -- auto close parens and brackets
  -- maximize window and restore to orig size
  "szw/vim-maximizer",
  -- markdown preview
  "kristijanhusak/vim-dadbod-ui",
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-completion",
  "RRethy/vim-illuminate",
  "kamykn/spelunker.vim",
  change_detection = {
    notify = false,
  },
})
