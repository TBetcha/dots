--
local group = vim.api.nvim_create_augroup("marks-fix-hl", {})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = group,
  callback = function()
    vim.api.nvim_set_hl(0, "MarkSignNumHL", {})
  end,
})
function ColorMyPencils(color)
	color = color or "cattpuccin"
	-- vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='gray', bold=false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#ffe5b4', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='gray', bold=false })
end


ColorMyPencils()
LineNumberColors()
