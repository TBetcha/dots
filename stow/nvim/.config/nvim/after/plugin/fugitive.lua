vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local Tbetcha_Fugitive = vim.api.nvim_create_augroup("Tbetcha_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Tbetcha_Fugitive,
    pattern = "*",
    callback = function()
        print("help", vim.bo.ft)
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        print("twas a great success", vim.bo.ft, bufnr, vim.inspect(opts))
        vim.keymap.set("n", "<leader>ps", function()
            vim.cmd [[ Git push ]]
        end, opts)

        -- ff always
        vim.keymap.set("n", "<leader>pl", function()
            vim.cmd [[ Git pull --ff ]]
        end, opts)
    end
})
