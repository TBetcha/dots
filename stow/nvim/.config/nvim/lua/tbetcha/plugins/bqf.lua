return {
  "kevinhwang91/nvim-bqf",
  dependencies = { "junegunn/fzf", "nvim-treesitter" },
  -- keys = {
  --   vim.keymap.set("n", "<leader>bqa ", "<Cmd>BqfToggleAuto<CR>"),
  --   vim.keymap.set("n", "<leader>bqt", "<Cmd>BqfToggle<CR>"),
  --   vim.keymap.set("n", "<leader>bqe ", "<Cmd>BqfEnable<CR>"),
  --   vim.keymap.set("n", "<leader>bqd ", "<Cmd>BqfDisable<CR>"),
    -- vim.keymap.set("n", "<leader>bqo ", "<Cmd>Bqf Open<CR>"),
    -- vim.keymap.set("n", "<leader>bqc ", "<Cmd>Bqf Close<CR>"),
  -- },
  event = "VeryLazy",
  opts = {
    auto_enable = {
      description = [[Enable nvim-bqf in quickfix window automatically]],
      default = true,
    },
    magic_window = {
      description = [[Give the window magic, when the window is splited horizontally, keep
            the distance between the current line and the top/bottom border of neovim unchanged.
            It's a bit like a floating window, but the window is indeed a normal window, without
            any floating attributes.]],
      default = true,
    },
    auto_resize_height = {
      description = [[Resize quickfix window height automatically.
            Shrink higher height to size of list in quickfix window, otherwise extend height
            to size of list or to default height (10)]],
      default = false,
    },
    preview = {
      win_height = 12,
      win_vheight = 12,
      delay_syntax = 80,
      border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
      show_title = false,
      should_preview_cb = function(bufnr, qwinid)
        local ret = true
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local fsize = vim.fn.getfsize(bufname)
        if fsize > 100 * 1024 then
          -- skip file size greater than 100k
          ret = false
        elseif bufname:match("^fugitive://") then
          -- skip fugitive buffer
          ret = false
        end
        return ret
      end,
    },
    -- preview = {
    --   auto_preview = {
    --     description = [[Enable preview in quickfix window automatically]],
    --     default = true,
    --   },
    --   border = {
    --     description = [[The border for preview window,
    --             `:h nvim_open_win() | call search('border:')`]],
    --     default = "rounded",
    --   },
    --   show_title = {
    --     description = [[Show the window title]],
    --     default = true,
    --   },
    --   show_scroll_bar = {
    --     description = [[Show the scroll bar]],
    --     default = true,
    --   },
    --   delay_syntax = {
    --     description = [[Delay time, to do syntax for previewed buffer, unit is millisecond]],
    --     default = 50,
    --   },
    --   win_height = {
    --     description = [[The height of preview window for horizontal layout,
    --             large value (like 999) perform preview window as a "full" mode]],
    --     default = 15,
    --   },
    --   win_vheight = {
    --     description = [[The height of preview window for vertical layout]],
    --     default = 15,
    --   },
    --   winblend = {
    --     description = [[The winblend for preview window, `:h winblend`]],
    --     default = 12,
    --   },
    --   wrap = {
    --     description = [[Wrap the line, `:h wrap` for detail]],
    --     default = false,
    --   },
    --   buf_label = {
    --     description = [[Add label of current item buffer at the end of the item line]],
    --     default = true,
    --   },
    --   should_preview_cb = {
    --     description = [[A callback function to decide whether to preview while switching buffer,
    --             with (bufnr: number, qwinid: number) parameters]],
    --     default = nil,
    --   },
    -- },
        func_map = {
        drop = 'o',
        openc = 'O',
        split = '<C-s>',
        tabdrop = '<C-t>',
        -- set to empty string to disable
        ptogglemode = 'zp,',
    },
    filter = {
      fzf = {
        action_for = {
          ["ctrl-t"] = {
            description = [[Press ctrl-t to open up the item in a new tab]],
            default = "tabedit",
          },
          ["ctrl-v"] = {
            description = [[Press ctrl-v to open up the item in a new vertical split]],
            default = "vsplit",
          },
          ["ctrl-x"] = {
            description = [[Press ctrl-x to open up the item in a new horizontal split]],
            default = "split",
          },
          ["ctrl-q"] = {
            description = [[Press ctrl-q to toggle sign for the selected items]],
            default = "signtoggle",
          },
          ["ctrl-c"] = {
            description = [[Press ctrl-c to close quickfix window and abort fzf]],
            default = "closeall",
          },
        },
        extra_opts = {
          description = "Extra options for fzf",
          default = { "--bind", "ctrl-o:toggle-all" },
        },
      },
    },
  },
}
