local bqf_status, bqf = pcall(require, "kevinhwang91/nvim-bqf")
if not bqf_status then
  return
end

bqf.setup({
  auto_enable = true,
  auto_resize_height = true,
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
})

vim.keymap.set("n", "<leader>bqt", "<Cmd>Bqf toggle<CR>")
vim.keymap.set("n", "<leader>bqo ", "<Cmd>Bqf Open<CR>")
vim.keymap.set("n", "<leader>bqc ", "<Cmd>Bqf Close<CR>")
vim.keymap.set("n", "<leader>bqf ", "<Cmd>Bqf Focus<CR>")
vim.keymap.set("n", "<leader>bqa ", "<Cmd>BqfToggleAuto<CR>")
