return {
  "kevinhwang91/nvim-bqf",
  dependencies = { "junegunn/fzf", "nvim-treesitter" },
  keys = {
    vim.keymap.set("n", "<leader>bqa ", "<Cmd>BqfToggleAuto<CR>"),
    vim.keymap.set("n", "<leader>bqt", "<Cmd>BqfToggle<CR>"),
    vim.keymap.set("n", "<leader>bqe ", "<Cmd>BqfEnable<CR>"),
    vim.keymap.set("n", "<leader>bqd ", "<Cmd>BqfDisable<CR>"),
    vim.keymap.set("n", "<leader>bqo ", "<Cmd>Bqf Open<CR>"),
    vim.keymap.set("n", "<leader>bqc ", "<Cmd>Bqf Close<CR>"),
  },
  event = "VeryLazy",
  opts = {
    auto_enable = true,
    -- description = [[Enable nvim-bqf in quickfix window automatically]],
    magic_window = true,
    -- description = [[Give the window magic, when the window is splited horizontally, keep
    --       the distance between the current line and the top/bottom border of neovim unchanged.
    --       It's a bit like a floating window, but the window is indeed a normal window, without
    -- any floating attributes.]],
    -- default = true,

    auto_resize_height = false,
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
  func_map = {
    drop = "o",
    openc = "O",
    split = "<C-s>",
    tabdrop = "<C-t>",
    -- set to empty string to disable
    ptogglemode = "zp,",
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
}
