return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",   -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",     -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim",         -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

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

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered({
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          winhighlight = "Normal:Pmenu,FloatBorder:CmpBorder,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder",
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-o"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
      }),
      -- sources for autocompletion - order should matter here for sorting purposes order
      sources = cmp.config.sources({
        { name = "luasnip" },     -- snippets
        { name = "copilot" },     -- new copilot
        { name = "cmp_tabnine" }, --tabnine but not from tabnine
        { name = "nvim_lsp" },    -- lsp
        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        }),
        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }),
        }),
        { name = "treesitter" }, -- treesitter
      }),
      -- configure lspkind for vs-code like icons
      formatting = {
        expandable_indicator = false,
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
  end,

  -- set completion color options for tabnine and copilot
  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" }),
  vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = "#6CC644" }),
}
