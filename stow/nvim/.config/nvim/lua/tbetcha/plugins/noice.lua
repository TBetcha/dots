return {
  "folke/noice.nvim",

  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  keys = {
    vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { silent = true }, { desc = "[N]oice [D]ismiss" }),
  },
  opts = {

    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      signature = {
        enabled = false,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = false,        -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true,            -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
    messages = {
      -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      -- This is a current Neovim limitation.
      enabled = true,              -- enables the Noice messages UI
      view = "mini",               -- default view for messages
      view_error = "notify",       -- view for errors
      view_warn = "notify",        -- view for warnings
      view_history = "messages",   -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    cmdline = {
      format = {
        cmdline = { pattern = "^:", icon = "󰘧", lang = "vim" },
      },
    },
    routes = {
      filter = {
        {
          event = "notify",
          find = "No information available",
        },
        {
          event = "notify",
          find = "help noice",
        },
      },
      opts = { skip = true },
    },
  },
  -- notify.setup({
  --   background_colour = "#000000",
  -- }),
  -- add any options here
}
