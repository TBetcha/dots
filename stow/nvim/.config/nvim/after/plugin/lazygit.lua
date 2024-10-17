local lazygit_status, lazygit = pcall(require, "lazygit")
if not lazygit_status then
  return
end
--
local plenary_status, plenary = pcall(require, "plenary")
if not plenary_status then
  return
end

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>")
  -- cmd = {
  --   "LazyGit",
  --   "LazyGitConfig",
  --   "LazyGitCurrentFile",
  --   "LazyGitFilter",
  --   "LazyGitFilterCurrentFile",
  -- },
  -- optional for floating window border decoration
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  -- keys = {
  --   { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  -- },
-- })
