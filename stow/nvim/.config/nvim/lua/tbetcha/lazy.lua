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
  -- tmux nav
  "christoomey/vim-tmux-navigator",

  ---------------------------------------
  --------------- THEMES  ---------------
  ---------------------------------------

  {
    "EdenEast/nightfox.nvim",
    priority = 1000, -- Ensure it loads first
    lazy = false,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    lazy = false,
  },
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
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Ensure it loads first
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
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- auto, main, moon, or dawn
        dark_variant = "moon", -- main, moon, or dawn
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("monokai-pro").setup({
        background_clear = { "float_win" },
        transparent_background = true,
        terminal_colors = true,
        devicons = true, -- highlight the icons of `nvim-web-devicons`
        styles = {
          comment = { italic = true },
          keyword = { underline = true }, -- any other keyword
          type = { bold = true }, -- (preferred) int, long, char, etc
          storageclass = { italic = false }, -- static, register, volatile, etc
          structure = { italic = false }, -- struct, union, enum, etc
          parameter = { italic = true }, -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        },
        -- Your config here
      })
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },
  -- lazy
  {
    "ray-x/aurora",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
    config = function()
      -- override defaults
      vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
    end,
  },
  -- Using lazy.nvim
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup({
        transparent = true,
        code_style = {
          comments = { italic = true },
          conditionals = {},
          keywords = { italic = true },
          functions = { bold = true },
          namespaces = { italic = true },
          parameters = { underline = true },
          strings = {},
          variables = {},
        },
      })
      require("bamboo").load()
    end,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require("night-owl").setup({
        transparent_background = true,
      })
    end,
  },
  {
    "comfysage/aki",
    priority = 1000,
    lazy = false,
    config = function()
      require("aki").setup({
        transparent_background = true,
      })
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = true,
      styles = {
        comments = { italic = true }, -- style for comments
        keywords = { italic = true }, -- style for keywords
        identifiers = { italic = true }, -- style for identifiers
        functions = { bold = true }, -- style for functions
        variables = { underline = true }, -- style for variables
      },
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },
  {
    "rmehri01/onenord.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("onenord").setup({
        styles = {
          comments = "italic",
          strings = "none",
          keywords = "italic",
          functions = "bold",
          variables = "none",
          diagnostics = "underline",
        },
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
      })
    end,
  },
  -- "navarasu/onedark.nvim",

  ---------------------------------------
  -------------- LSP & ISH  -------------
  ---------------------------------------
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      { "williamboman/mason.nvim" }, -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" }, -- Required
      -- source for text in buffer
      { "hrsh7th/cmp-buffer" },
      -- source for file system paths
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
    },
  },
  -- tabnine completion source
  { "tzachar/cmp-tabnine", build = "./install.sh" },
  --  tree sitter nodes for completionspack
  { "ray-x/cmp-treesitter" },
  -- snippet engine
  "L3MON4D3/LuaSnip",
  -- for autocompletion
  "saadparwaiz1/cmp_luasnip",
  -- useful snippets
  "rafamadriz/friendly-snippets",
  -- managing & installing lsp servers, linters & formatters
  "williamboman/mason.nvim",
  -- bridges gap b/w mason & lspconfig
  "williamboman/mason-lspconfig.nvim",
  -- formatting
  "jose-elias-alvarez/null-ls.nvim",
  -- bridges gap b/w mason & null-ls
  "jayp0521/mason-null-ls.nvim",
  "jose-elias-alvarez/typescript.nvim",
  --icons in lsp menu
  { "onsails/lspkind.nvim" },
  --enhanced lsp stuff that uses treesitter and not regex
  -- { "glepnir/lspsaga.nvim", version = "5dc14c9fd4230549da532c51ad555a4f64aa80d5" },
  { "glepnir/lspsaga.nvim" },

  --END OF LSP STUFF

  -- line at bottom of nvim window
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  -- reload that other plugins rely on
  { "nvim-lua/plenary.nvim" },
  -- telescope
  { "nvim-telescope/telescope.nvim", version = "0.1.4" },
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
  "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  -- git icons
  "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
  -- bar to show buffers
  -- "romgrk/barbar.nvim",
  -- --------------------------
  -- file explorer
  -- "nvim-tree/nvim-tree.lua",
  -- auto close parens and brackets
  "windwp/nvim-autopairs",
  -- maximize window and restore to orig size
  "szw/vim-maximizer",
  -- show indent guide
  "lukas-reineke/indent-blankline.nvim",
  -- highlight todos
  "folke/todo-comments.nvim",
  -- markdown preview
  {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      { "MunifTanjim/nui.nvim" },
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to  the notification view.
      --   If not available, we  `mini` as the fallback
      { "rcarriga/nvim-notify" },
    },
  },
  "kristijanhusak/vim-dadbod-ui",
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-completion",
  "windwp/nvim-ts-autotag",
  "MunifTanjim/prettier.nvim",
  "kevinhwang91/nvim-bqf",
  "RRethy/vim-illuminate",
  "kamykn/spelunker.vim",
  "chentoast/marks.nvim",
  change_detection = {
    notify = false,
  },
})
