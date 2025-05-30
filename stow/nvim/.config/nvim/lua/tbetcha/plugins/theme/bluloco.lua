return {
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    require("bluloco").setup({
      style = "dark", -- "auto" | "dark" | "light"
      transparent = true,
      italics = true,
      terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
      guicursor = true,
      rainbow_headings = false,              -- if you want different colored headings for each heading level
    })

    -- your optional config goes here, see below.
  end,
}
