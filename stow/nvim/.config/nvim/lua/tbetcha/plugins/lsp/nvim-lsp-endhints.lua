-- default settings
return {
  "chrisgrieser/nvim-lsp-endhints",
  config = function()
    local endhints = require("lsp-endhints")
    endhints.setup({
      autoEnableHints = true,
      icons = {
        type = "󰜁 ",
        parameter = "󰏪 ",
        offspec = " ", -- hint kind not defined in official LSP spec
        unknown = " ", -- hint kind is nil
      },
      label = {
        truncateAtChars = 20,
        padding = 1,
        marginLeft = 0,
        sameKindSeparator = ", ",
      },
      extmark = {
        priority = 50,
      },

      ---Function that overrides how hints are displayed.
      ---expects as output a table for `virt_text` from `nvim_buf_set_extmark`,
      ---that is a table of string tuples (text & highlight group)
      ---To use filetype-specific formatting, get the filetype via
      ---`vim.bo[bufnr].filetype`, to conditionally use the default formatting
      ---function, use `defaultHintFormatFunc(hints)`.
      ---@type function(hints: {label: string, col: number, kind: string}[], bufnr: number, defaultHintFormatFunc: func): {[1]: string, [2]: string}[]
      hintFormatFunc = nil,
    })
  end,
}
