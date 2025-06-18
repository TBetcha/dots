return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = {  "prettier"},
        typescript = {  "prettier"},
        javascriptreact = { "prettier"},
        typescriptreact = { "prettier"},
        svelte = { "prettier"},
        vue = {  "prettier"},
        css = {  "prettier"},
        html = { "prettier"},
        json = { "prettier"},
        yaml = { "prettier"},
        markdown = { "prettier"},
        graphql = { "prettier"},
        liquid = {  "prettier"},
        fsharp = { "fantomas" },
        csharp = { "csharpier" },
        python = function(bufnr)
          if require("conform").get_formatter_info("pyright", bufnr).available then
            return { "ruff_format" }
          else
            return { "isort", "black" }
          end
        end,
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      },
    })

    require("conform").setup({
      format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { "lua" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
      end,
    })

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
