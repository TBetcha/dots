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

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function LineNumberColors(color)
  if color == "cattpuccin" then
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "gray", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffe5b4", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "gray", bold = false })
  end

  if color == "onedark" then
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ABB2BF", bold = false })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#61AFEF", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ABB2BF", bold = false })
  end
end

function HarpoonColors(color)
  if color == "cattpuccin" then
    vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
    vim.cmd("highlight! HarpoonActive guibg=NONE guifg=#eba0ac")
    vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
    vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
    vim.cmd("highlight! TabLineFill guibg=NONE guifg=NONE")
  end

  if color == "onedark" then
    vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#ABB2BF")
    vim.cmd("highlight! HarpoonActive guibg=NONE guifg=#E06C75")
    vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#61AFEF")
    vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#E5C07B")
    vim.cmd("highlight! TabLineFill guibg=NONE guifg=NONE")
  end
end

ColorMyPencils()
LineNumberColors()
HarpoonColors()
