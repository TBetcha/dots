local sonokai_status, sonokai = pcall(require, "sonokai")
if not sonokai_status then
  return
end

sonokai.setup({
  options = {
    style = "maia",
    enable_italic = 1,
    transparent_background = 2,
  },
})
