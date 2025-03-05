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
  "nvim-tree/nvim-tree.lua",
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
  "kdheepak/lazygit.nvim",
  "windwp/nvim-ts-autotag",
  "MunifTanjim/prettier.nvim",
  "kevinhwang91/nvim-bqf",
  "RRethy/vim-illuminate",
  "b0o/incline.nvim",
  "kamykn/spelunker.vim",
  {
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup()
    end,
  },
  -- {
  --   "smjonas/inc-rename.nvim",
  --   config = function()
  --     require("inc_rename").setup(require("noice").setup({
  --       presets = { inc_rename = true },
  --     }))
  --   end,
  --   vim.keymap.set("n", "<leader>ra", ":IncRename "),
  -- },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
    vim.keymap.set("n", "<leader>ra", ":IncRename "),
  },
  ---------------------------------------
  --------------- EASE OF USE  ----------
  ---------------------------------------

  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      })
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    opt = true, -- Set this to true if the plugin is optional
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },

  ---------------------------------------
  --------------- DEV FEATURES ----------
  ---------------------------------------

  {
    "mfussenegger/nvim-dap",
    enabled = vim.fn.has("win32") == 0,
    event = "User BaseFile",
    config = function()
      local dap = require("dap")
      -- C#
      dap.adapters.coreclr = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
        args = { "--interpreter=vscode" },
      }
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function() -- Ask the user what executable wants to debug
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug", "file")
          end,
        },
      }

      -- F#
      dap.configurations.fsharp = dap.configurations.cs
    end, -- of dap config
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "rcarriga/cmp-dap",
      "jay-babu/mason-nvim-dap.nvim",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = { floating = { border = "rounded" } },
    config = function(_, opts)
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      dapui.setup(opts)
    end,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  {
    "rcarriga/cmp-dap",
    dependencies = { "nvim-cmp" },
    config = function()
      require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" },
        },
      })
    end,
  },
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },

  -------------------------------------
  --------------- UI RELATED ----------
  -------------------------------------
  -- show diagnostics and location list
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        mode = "diagnostics",
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.3,
        },
      },
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xe",
        "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xE",
        "<cmd>Trouble diagnostics toggle filter.buf=0 filter.severity=vim.diagnostic.severity.ERROR<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>xs",
        "<cmd>Trouble symbols toggle focus=false type=split results.win.relative=win results.win.position=right<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>xr",
        "<cmd>Trouble lsp_references toggle focus=false type=split results.win.relative=win results.win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble lsp toggle focus=false type=split results.win.relative=win results.win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xl",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
      {
        "<leader>xt",
        "<cmd>TodoTrouble toggle focus=false type=split results.win.relative=win results.win.position=right<cr>",
        desc = "List of todos",
      },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(
        opts,
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if vim.tbl_contains({ "null-ls" }, client.name) then -- blacklist lsp
              return
            end
            require("lsp_signature").on_attach({
              -- ... setup options here ...
            }, bufnr)
          end,
        })
      )
      vim.keymap.set({ "n" }, "<leader>k", function()
        require("lsp_signature").toggle_float_win()
      end, { silent = true, noremap = true, desc = "toggle signature" })

      vim.keymap.set({ "n" }, "<M-s>", function()
        require("lsp_signature").select_signature_key()
      end, { silent = true, noremap = true, desc = "toggle signature" })
    end,
  },
  {
    "d7omdev/nuget.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("nuget").setup()
    end,
  },
  -- {
  --   "stevearc/oil.nvim",
  --   config = function()
  --     local oil = require("oil")
  --     oil.setup({
  --       win_opts = {
  --         signcolumn = "yes",
  --       },
  --       delete_to_trash = true,
  --       skip_confirm_for_simple_edits = true,
  --       view_options = {
  --         show_hidden = true,
  --         is_always_hidden = function(name, bufnr)
  --           return name == ".." or name == ".git"
  --         end,
  --       },
  --     })
  --     vim.keymap.set("n", "-", oil.toggle_float, {})
  --   end,
  -- },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
})
require("lazy").setup(plugins, {})
