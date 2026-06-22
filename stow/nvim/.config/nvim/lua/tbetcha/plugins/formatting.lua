return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        svelte = { "prettierd" },
        vue = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        liquid = { "prettierd" },
        fsharp = { "fantomas" },
        csharp = { "csharpier" },
        python = { "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 2000,
      },
    })
    --   format_on_save = function(bufnr)
    --     -- Disable autoformat on certain filetypes
    --     local ignore_filetypes = { "lua" }
    --     if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
    --       return
    --     end
    --   end,
    -- })

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
