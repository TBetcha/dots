local todo_status, todo = pcall(require, "todo-comments")
if not todo_status then
	return
end

-- defaults plug setting comments to false
todo.setup({
	highlight = {
        -- HACK: setting to false so fsharp will work correctly
		comments_only = false, -- uses treesitter to match keywords in comments only
	},
})


vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
vim.keymap.set("n", "<leader>xt", ":TodoTrouble cwd=./ <CR>")
vim.keymap.set("n", "<leader>tdt", ":TodoTelescope cwd=./<CR>")
vim.keymap.set("n", "<leader>tqf", "<cmd>:TodoQuickFix cwd=./<CR>")
