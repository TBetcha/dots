  return {
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
  }

