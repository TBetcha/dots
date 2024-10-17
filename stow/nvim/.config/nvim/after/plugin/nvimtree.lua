
local nvimtree_status, nvimtree = pcall(require, "nvim-tree")
if not nvimtree_status then
	return
end

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    ---

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- -- disable netrw at the very start of your init.lua
    -- vim.g.loaded_netrw = 1
    -- vim.g.loaded_netrwPlugin = 1
    --
    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<leader>..', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '<leader>e', api.tree.toggle)
    vim.keymap.set('n', '<leader>ec', api.tree.close)
    vim.keymap.set('n', '<leader>ef', api.tree.focus)
    -- vim.keymap.set('n', '[g', api.node.navigate.git.prev)
    -- vim.keymap.set('n', ']g', api.node.navigate.git.next)
    vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev)
    vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next)
    --the two below don't work
    --vim.keymap.set('n', '<leader>vv', api.node.open_vertical)
    --vim.keymap.set('n', '<leader>hh', api.node.open_horizontal)
end
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#9540d6 ]])
-- pass to setup along with your other options
---
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
        side = "right",
    },
    renderer = {
        group_empty = true,
        indent_width = 1,
        icons = {
            web_devicons = {
                file = {
                    enable = true,
                    color = true,
                },
                folder = {
                    enable = true,
                    color = true,
                },
            },
            glyphs = {
                folder = {
                    arrow_closed = "", -- arrow when folder is closed
                    arrow_open = "󰦺", -- arrow when folder is open
                },
            },

        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            max = vim.diagnostic.severity.ERROR,
            min = vim.diagnostic.severity.WARNING,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    on_attach = my_on_attach
})
