return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local icons = require("tbetcha.icons")
    local telescope = require("telescope")
    local lspsaga = require("lspsaga")
    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        keymap.set("n", "<leader>fa", "<cmd>Lspsaga finder tyd+ref+imp+def<CR>", opts) -- show definition, references
        keymap.set("n", "gc", function()
          vim.lsp.buf.declaration()
        end, opts) -- got to declaration
        keymap.set("n", "<leader>gd", function()
          vim.lsp.buf.definition()
        end, opts) -- lsp go to definition
        keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
        keymap.set("n", "gi", function()
          vim.lsp.buf.implementation()
        end, opts) -- go to implementation
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
        keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
        keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
        -- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
        keymap.set("n", "[e", function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end) -- jump to previous diagnostic in buffer
        keymap.set("n", "]e", function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end) -- jump to next diagnostic in buffer
        keymap.set("n", "[d", function()
          require("lspsaga.diagnostic"):goto_prev()
        end) -- jump to previous diagnostic in buffer
        keymap.set("n", "]d", function()
          require("lspsaga.diagnostic"):goto_next()
        end) -- jump to next diagnostic in buffer
        -- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
        keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
        keymap.set("n", "<leader>ot", "<cmd>Lspsaga outline Toggle<CR>", opts) -- see outline on right hand side
        keymap.set({ "n", "t" }, "<leader>tw", "<cmd>Lspsaga term_toggle<CR>", opts) -- see outline on right hand side
        keymap.set("n", "gtd", function()
          vim.lsp.buf.type_definition()
        end, opts)
        keymap.set("n", "<leader>rr", function()
          vim.lsp.buf.references()
        end, opts)
        -- keymap.set("i", "<leader>sig", function() vim.lsp.buf.signature_help() end, opts)
        keymap.set("n", "<leader>ws", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        keymap.set("n", "<leader>of", function()
          vim.diagnostic.open_float()
        end, opts)
        keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>")
        keymap.set("n", "<leader>trr", "<cmd>Telescope lsp_references<cr>", { buffer = true })
      end,
    })
    vim.diagnostic.config({
      virtual_text = true,
      code_actions = {
        enable = true,
        icons = {
          hint = icons.diagnostics.Hint,
          info = icons.diagnostics.Info,
          warning = icons.diagnostics.Warn,
          error = icons.diagnostics.Error,
        },
      },
    })
    vim.lsp.codelens = { enable = true, resolve = true }

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = {
      Error = icons.diagnostics.Error,
      Warn = icons.diagnostics.Warn,
      Hint = icons.diagnostics.Hint,
      Info = icons.diagnostics.Info,
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

      omnisharp = function()
        local pid = vim.fn.getpid()
        local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"
        lspconfig.omnisharp.setup({
          cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
          require("lspconfig")["omnisharp"].setup({
            capabilities = cmp_nvim_lsp.default_capabilities(),
            virtual_text = true,
            code_lens = {
              enable = true,
              resolve = true,
            },
          }),
        })
      end,
      ["svelte"] = function()
        -- configure svelte server
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["fsautocomplete"] = function()
        -- configure graphql language server
        lspconfig["fsautocomplete"].setup({
          capabilities = capabilities,
          filetypes = { "fsharp" },
        })
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
