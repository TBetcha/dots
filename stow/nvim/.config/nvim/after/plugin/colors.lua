function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='gray', bold=false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#a6e3a1', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='gray', bold=false })
end


ColorMyPencils()
LineNumberColors()
