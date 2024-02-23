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
    -- tmux nav
    "christoomey/vim-tmux-navigator",
    -- theme
    {
        "EdenEast/nightfox.nvim",
        priority = 1000, -- Ensure it loads first
    },
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Ensure it loads first
    },
    -- "navarasu/onedark.nvim",
    -- LSP STUFF
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },       -- Required
            { "williamboman/mason.nvim" },     -- Optional
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
    -- copilot that doesn't suck
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    -- copilot completions sources
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
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
    { "glepnir/lspsaga.nvim", version = "5dc14c9fd4230549da532c51ad555a4f64aa80d5" },

    --END OF LSP STUFF

    -- show diagnostics and location list
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = true,
                -- your configuration comes here
                -- or leave it empty to  the default settings
                -- refer to the configuration section below
            })
        end,
    },
    -- line at bottom of nvim window
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    --rust stuff
    "simrat39/rust-tools.nvim",
    -- reload that other plugins rely on
    { "nvim-lua/plenary.nvim" },
    -- telescope
    { "nvim-telescope/telescope.nvim",            version = "0.1.4" },
    -- fzf searching for telescope
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- zoxide telescope extension
    "jvgrootveld/telescope-zoxide",
    -- required for zoxide ext
    "nvim-lua/popup.nvim",
    --file browser
    { "nvim-telescope/telescope-file-browser.nvim" },
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
    "theprimeagen/harpoon",
    -- long lived undos
    "mbbill/undotree",
    -- git integration
    "tpope/vim-fugitive",
    -- surround motions
    "tpope/vim-surround",
    -- icons
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    -- git icons
    "lewis6991/gitsigns.nvim",   -- OPTIONAL: for git status
    -- bar to show buffers
    -- "romgrk/barbar.nvim",
    -- --------------------------
    -- file explorer
    "nvim-tree/nvim-tree.lua",
    -- scala lsp
    -- "scalameta/nvim-metals"
    -- debugger
    -- { "mfussenegger/nvim-dap" },
    -- -------------------------------
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
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    "chentoast/marks.nvim",
    "kristijanhusak/vim-dadbod-ui",
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
})
require("lazy").setup(plugins, {})
