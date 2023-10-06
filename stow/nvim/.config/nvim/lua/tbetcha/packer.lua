-- This  file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	--   -- Packer can manage itself

	-- tmux nav
	use("christoomey/vim-tmux-navigator")
	-- theme
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("wbthomason/packer.nvim")

	-- LSP STUFF
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	-- builtin lsp to easily configure language servers
	use("neovim/nvim-lspconfig")
	-- for autocompletion
	use("hrsh7th/cmp-nvim-lsp")
	-- autocompletion plugin
	use("hrsh7th/nvim-cmp")
	-- source for text in buffer
	use("hrsh7th/cmp-buffer")
	-- source for file system paths
	use("hrsh7th/cmp-path")
	-- copilot that doesn't suck
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})
	-- copilot completions sources
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})
	-- tabnine completion source
	use({ "tzachar/cmp-tabnine", run = "./install.sh" })
	-- use tree sitter nodes for completionspack
	use({ "ray-x/cmp-treesitter" })
	-- snippet engine
	use("L3MON4D3/LuaSnip")
	-- for autocompletion
	use("saadparwaiz1/cmp_luasnip")
	-- useful snippets
	use("rafamadriz/friendly-snippets")
	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim")
	-- bridges gap b/w mason & lspconfig
	use("williamboman/mason-lspconfig.nvim")
	-- formatting
	use("jose-elias-alvarez/null-ls.nvim")
	-- bridges gap b/w mason & null-ls
	use("jayp0521/mason-null-ls.nvim")
	-- ts plugin
	-- use("jose-elias-alvarez/typescript.nvim")
	--icons in lsp menu
	use({ "onsails/lspkind.nvim" })
	--enhanced lsp stuff that uses treesitter and not regex
	use({ "glepnir/lspsaga.nvim", branch = "5dc14c9fd4230549da532c51ad555a4f64aa80d5" })

	--END OF LSP STUFF

	-- show diagnostics and location list
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = true,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	-- line at bottom of nvim window
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	--rust stuff
	use("simrat39/rust-tools.nvim")
	-- reload that other plugins rely on
	use({ "nvim-lua/plenary.nvim" })
	-- telescope
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.2" })
	-- fzf searching for telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- zoxide telescope extension
	use("jvgrootveld/telescope-zoxide")
	-- required for zoxide ext
	use("nvim-lua/popup.nvim")
	--file browser
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	--commenting
	use({ "numToStr/Comment.nvim" })
	-- language parser
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	-- show parsing of language elements live
	use("nvim-treesitter/playground")
	-- keep context while scrolling
	use("nvim-treesitter/nvim-treesitter-context")
	--fast switching of buffers
	use("theprimeagen/harpoon")
	-- long lived undos
	use("mbbill/undotree")
	-- git integration
	use("tpope/vim-fugitive")
	-- surround motions
	use("tpope/vim-surround")
	-- icons
	use("nvim-tree/nvim-web-devicons") -- OPTIONAL: for file icons
	-- git icons
	use("lewis6991/gitsigns.nvim") -- OPTIONAL: for git status
	-- bar to show buffers
	use("romgrk/barbar.nvim")
	-- --------------------------
	-- file explorer
	-- use("nvim-tree/nvim-tree.lua")
	-- scala lsp
	-- use("scalameta/nvim-metals")
	-- debugger
	use({ "mfussenegger/nvim-dap" })
	-- -------------------------------
	-- auto close parens and brackets
	use("windwp/nvim-autopairs")
	-- maximize window and restore to orig size
	use("szw/vim-maximizer")
	-- show indent guide
	use("lukas-reineke/indent-blankline.nvim")
	-- highlight todos
	use("folke/todo-comments.nvim")
	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	use({
		"folke/noice.nvim",
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			{ "MunifTanjim/nui.nvim" },
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			{ "rcarriga/nvim-notify" },
		},
	})
end)
