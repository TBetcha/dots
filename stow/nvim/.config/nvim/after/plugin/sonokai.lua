local sonokai_status, sonokai = pcall(require, "sonokai")
if not sonokai_status then
    return
end

sonokai.setup({})
