local neogit_status, neogit = pcall(require, "neogit")
if not neogit_status then
  return
end

neogit.setup {}

vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<CR>", { noremap = true, silent = true })