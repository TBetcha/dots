local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
  return
end

local builtin_status, builtin = pcall(require, "telescope.builtin")
if not builtin_status then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

local telescope_config_status, telescope_config = require("telescope.config")
if not telescope_config_status then
  return
end

local telescope_fzf_status, telescope_fzf = require("telescope").load_extension("fzf")
if not telescope_fzf_status then
  return
end

-- leader z
local zoxide_status, zoxide = require("telescope._extensions.zoxide.utils")
if not zoxide_status then
  return
end

-- https://github.com/nvim-telescope/telescope-file-browser.nvim
local fb_status, fb = require("telescope").load_extension("file_browser")
if not fb_status then
  return
end

-- TODO: fix me
vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>rg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "tgd", builtin.lsp_definitions, { desc = "[S]how [L]SP [D]efinitions" })
vim.keymap.set("n", "tgi", builtin.lsp_implementations, { desc = "[S]how [L]SP [I]mplementations" })
vim.keymap.set("n", "tgc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["tgc" for git commits]
vim.keymap.set("n", "tgf", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["tgf" for git file commits]
vim.keymap.set("n", "tgb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["tgb" for git branch]
vim.keymap.set("n", "tgs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["tgs" for git status]
vim.keymap.set(
  "n",
  "<leader>zo",
  ":lua require'telescope'.extensions.zoxide.list{results_title='Z Directories', prompt_title='Z Prompt', prompt_prefix='  ', layout_strategy='center'}<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>km",
  [[<Cmd>lua require'telescope.builtin'.keymaps({results_title='Key Maps Results'})<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>fb",
  [[<Cmd>lua require'telescope'.extensions.file_browser.file_browser()<CR>]],
  { noremap = true, silent = true }
)

-- Clone the default Telescope configuration
local vimgrep_arguments = {
  "rg",
  "--color=never",
  "--no-heading",
  "--with-filename",
  "--line-number",
  "--column",
  "--smart-case",
  "--hidden",
}
--
-- -- I want to search in hidden/dot files.
-- table.insert(vimgrep_arguments, "--hidden")
-- -- I don't want to search in the `.git` directory.
-- table.insert(vimgrep_arguments, "--glob")
-- table.insert(vimgrep_arguments, "!**/.git/*")
--
local center_list = require("telescope.themes").get_dropdown({
  winblend = 10,
  width = 0.7,
  prompt = "🔍",
  results_height = 15,
  previewer = false,
})

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    selection_caret = " ",
    layout_config = {
      prompt_position = "top",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
        winblend = 10,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },
    vimgrep_arguments = vimgrep_arguments,
    mappings = {
      i = {
        ["<C-q"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
      n = {
        ["<C-c>"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      no_ignore = true,
      hidden = true,
      prompt_prefix = " 🔍 ",
      layout_strategy = "horizontal",
    },
    buffers = {
      prompt_prefix = " ⚡ ",
      previewer = false,
      layout_strategy = "center",
    },
    git_files = {
      prompt_prefix = "  ",
      previewer = false,
      layout_strategy = "center",
    },
    git_commits = {
      prompt_prefix = "  ",
    },
    grep_string = {
      vimgrep_arguments = vimgrep_arguments,
      prompt_prefix = "   ",
      layout_strategy = "horizontal",
    },
    live_grep = {
      vimgrep_arguments = vimgrep_arguments,
      prompt_prefix = "   ",
      layout_strategy = "horizontal",
    },
    lsp_definitions = {
      -- layout_config = {
      -- 	width = 0.5,
      -- 	preview_width = 0.9,
      -- },
      path_display = { "shorten" },
      results_title = "Definitions",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or ignore_case or respect_case-- the default case_mode is smart_case"
    },
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },

    file_browser = {
      prompt_title = "  File Browser",
      prompt_prefix = "WYA >> ",
      prompt_position = "top",
      path_display = { "smart" },
      previewer = false,
      hijack_netrw = false,
      cwd = "./",
      layout_strategy = "horizontal",
      layout_config = { preview_width = 0.65, width = 0.75 },
    },
  },
})

local M = {}

function M.file_explorer()
  fb({
    prompt_title = "  File Browser",
    path_display = { "smart" },
    cwd = "~",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  })
end

return M
