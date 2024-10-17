local nightfly_status, nightfly = pcall(require, "nightfly")
if not nightfly_status then
    return
end

local cmp_status, cmp = pcall(require, "nvim-cmp")
if not cmp_status then
    return
end


local winhighlight = {
  winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
}
cmp.setup({
  window = {
    completion = cmp.config.window.bordered(winhighlight),
    documentation = cmp.config.window.bordered(winhighlight),
  }
})
-- Lua initialization file
vim.g.nightflyTransparent = true
-- Lua initialization file
vim.g.nightflyItalics = true
-- Lua initialization file
vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }
