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
    "sainnhe/sonokai",
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
  -- {
  --   "VonHeikemen/lsp-zero.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     -- LSP Support
  --     { "neovim/nvim-lspconfig" }, -- Required
  --     { "williamboman/mason.nvim" }, -- Optional
  --     { "williamboman/mason-lspconfig.nvim" }, -- Optional
  --
  --     -- Autocompletion
  --     { "hrsh7th/nvim-cmp" }, -- Required
  --     { "hrsh7th/cmp-nvim-lsp" }, -- Required
  --     { "L3MON4D3/LuaSnip" }, -- Required
  --     -- source for text in buffer
  --     { "hrsh7th/cmp-buffer" },
  --     -- source for file system paths
  --     { "hrsh7th/cmp-path" },
  --     { "hrsh7th/cmp-cmdline" },
  --   },
  -- },
  --  tree sitter nodes for completionspack
  { "ray-x/cmp-treesitter" },
  -- snippet engine
  "L3MON4D3/LuaSnip",
  -- for autocompletion
  "saadparwaiz1/cmp_luasnip",
  -- useful snippets
  "rafamadriz/friendly-snippets",
  -- managing & installing lsp servers, linters & formatters
  -- "williamboman/mason.nvim",
  -- -- bridges gap b/w mason & lspconfig
  -- "williamboman/mason-lspconfig.nvim",
  -- formatting
  -- "jose-elias-alvarez/null-ls.nvim",
  -- bridges gap b/w mason & null-ls
  -- "jayp0521/mason-null-ls.nvim",
  "jose-elias-alvarez/typescript.nvim",
  --icons in lsp menu
  { "onsails/lspkind.nvim" },
  --enhanced lsp stuff that uses treesitter and not regex
  -- { "glepnir/lspsaga.nvim", version = "5dc14c9fd4230549da532c51ad555a4f64aa80d5" },
  { "glepnir/lspsaga.nvim" },

  --END OF LSP STUFF

  -- reload that other plugins rely on
  -- { "nvim-lua/plenary.nvim" },
  -- telescope
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
  -- keep context while scrolling
  "nvim-treesitter/nvim-treesitter-context",
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
  -- "szw/vim-maximizer",
  -- markdown preview
  "kristijanhusak/vim-dadbod-ui",
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-completion",
  "MunifTanjim/prettier.nvim",
  "RRethy/vim-illuminate",
  "kamykn/spelunker.vim",
  change_detection = {
    notify = false,
  },
})
