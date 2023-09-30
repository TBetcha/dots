-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end
 
-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
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

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-o"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = nil,
		["<S-Tab>"] = nil,
	}),
	-- sources for autocompletion - order should matter here for sorting purposes order
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "copilot" }, -- new copilot
		{ name = "cmp_tabnine" }, --tabnine but not from tabnine
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
		{ name = "treesitter" }, -- treesitter
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",
			symbol_map = { Copilot = "", cmp_tabnine = ""},
			before = function(entry, vim_item)
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					luasnip = "[Snippet]",
					buffer = "[Buffer]",
					path = "[Path]",
                    copilot ="[Copilot]",
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
            require('cmp_tabnine.compare'),
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
vim.api.nvim_set_hl(0, "CmpItemKindTabNine", {fg ="#6CC644"})
---

--" Here we configure nvim's LSP feature and nvim-lspconfig.
local function nvim_lsp()
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }
    -- Set your bindings for LSP features here.
    buf_set_keymap('n', 'gdc', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>tgr', '<cmd>Telescope lsp_references<cr>', {buffer = true})
    buf_set_keymap("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    buf_set_keymap("n", "<leader>of", function() vim.diagnostic.open_float() end, opts)
  end

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


  local setup = function(server)
    server.setup {
      autostart = true,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      capabilities = capabilities
    }
  end
  local lspconfig = require('lspconfig')
  -- setup(require('ionide'))
  -- -- add other languages here
  -- setup(lspconfig.ocamllsp)
  -- setup(lspconfig.ccls)
  
  -- Recommended: this makes the hover windows unfocusable.
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { focusable = false }
  )

  -- vim.lsp.codelens = false
  -- Optional: this changes the prefix of diagnostic texts.
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
   vim.lsp.diagnostic.on_publish_diagnostics, {
     virtual_text = {
       prefix = '!',
     },
   }
  )
end
-- Create the configuration for Ionide
--
-- local function fsharp()
--     fs.lsp_auto_setup = 0
--     vim.lsp.codelens = false
-- end
