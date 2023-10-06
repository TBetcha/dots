-- import mason safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
    return
end

-- -- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

-- import lsp saga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    return
end

-- import lsp zero safely
local lspzero_status, lsp = pcall(require, "lsp-zero")
if not lspzero_status then
    return
end

local cmp_status, cmp = pcall(require, "cmp")
if not lspzero_status then
    return
end

local comparators = {}

comparators.score = function(entry1, entry2)
    if entry1.score and entry2.score then
        return entry1.score > entry2.score
    end
end

comparators.prioritize = function(entry1, entry2)
    if entry1.copilot and not entry2.copilot then
        return true
    elseif entry2.copilot and not entry1.copilot then
        return false
    end
end

local keymap = vim.keymap -- for conciseness

local icons = require("tbetcha.icons")

-- enable mason
mason.setup()

mason_lspconfig.setup({
    -- list of servers for mason to install
    ensure_installed = {
        "rust_analyzer",
        "fsautocomplete",
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
    },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
    -- list of formatters & linters for mason to install
    ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
        "fantomas", -- fsharp formatter
        "buf", -- protobuf formatter
    },
    -- auto-install configured formatters & linters (with null-ls)
    automatic_installation = true,
})

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

local capabilities = cmp_nvim_lsp.default_capabilities()
lsp.preset("recommended")

--Fx Undefined global 'vim'
-- lsp.nvim_workspace()

-- local cmp_format = lsp.cmp_format()
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),  -- close completion window
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-o"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
    }),
    -- sources for autocompletion - order should matter here for sorting purposes order
    sources = cmp.config.sources({
        { name = "copilot" }, -- new copilot
        { name = "cmp_tabnine" }, --tabnine but not from tabnine
        { name = "luasnip" }, -- snippets
        { name = "nvim_lsp" }, -- lsp
        { name = "buffer" }, -- text within current buffer
        { name = "path" },  -- file system paths
        { name = "treesitter" }, -- treesitter
    }),
    -- configure lspkind for vs-code like icons
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = { Copilot = "", cmp_tabnine = "" },
            before = function(entry, vim_item)
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                    copilot = "[Copilot]",
                    cmp_tabnine = "[TN]",
                    treesitter = "[Treesitter]",
                })[entry.source.name]
                return vim_item
            end,
        }),
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            comparators.prioritize,
            require("cmp_tabnine.compare"),
            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})

-- set completion color options for tabnine and copilot
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = "#6CC644" })

lsp.set_preferences({
    suggest_lsp_servers = false,
    lsp.set_sign_icons({
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Info, }),
})

-- remaps exist in the current buffer. If we have an lsp use it— if not things like gd will try to do vims best jump to def
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- jump into doc window with kk use gx to go to link
    keymap.set("n", "<leader>fa", "<cmd>Lspsaga finder tyd+ref+def<CR>", opts) -- show definition, references
    keymap.set("n", "gdc", function() vim.lsp.buf.declaration() end, opts) -- got to declaration
    keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)                                                   -- lsp go to definition
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
    keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)                                                                  -- go to implementation
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)         -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)              -- smart rename
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)        -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)        -- jump to next diagnostic in buffer
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                    -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>Lspsaga outline Toggle<CR>", opts)       -- see outline on right hand side
    keymap.set("n", "gtd", function() vim.lsp.buf.type_definition() end, opts)
    keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
    keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
    keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    keymap.set("n", "<leader>of", function() vim.diagnostic.open_float() end, opts)
    keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>")
    keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { buffer = true })

    -- typescript specific keymaps (e.g. rename file and update imports)
    if client.name == "tsserver" then
        keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
        keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
        keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
    end
end)

lsp.setup()

-- -- used to enable autocompletion (assign to every lsp server config)
---
-- -- Create the configuration for metals
-- ---
-- local metals_lsp = lsp.build_options('metals', {})
-- local metals_config = require('metals').bare_config()
--
-- metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
-- ---
-- -- Autocmd that will actually be in charging of starting metals
-- ---
-- local metals_augroup = vim.api.nvim_create_augroup('nvim-metals', {clear = true})
-- vim.api.nvim_create_autocmd('FileType', {
--   group = metals_augroup,
--   pattern = {'scala', 'sbt', 'java'},
--   callback = function()
--     require('metals').initialize_or_attach(metals_config)
--   end
-- })
--
vim.diagnostic.config({
    virtual_text = true,
})
