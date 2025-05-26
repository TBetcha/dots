return -- lazy.nvim
{
  "WillEhrendreich/Ionide-Nvim",
  dependencies = {
    {
      -- highly recommended to use Mason. very nice for lsp/linter/tool installations.
      "williamboman/mason.nvim",
      opts = {
        -- here we make sure fsautocomplete is downloaded by mason, which Ionide absolutely needs in order to work.
        ensure_installed = {
          "fsautocomplete",
        },
      },
      {
        -- very recommended to use nvim-lspconfig, as it takes care of much of the management of starting Ionide,
        "neovim/nvim-lspconfig",
        version = false,   -- last release is way too old
        opts = {
          servers = {
            ---@type IonideOptions
            ionide = {
              IonideNvimSettings = {
              },
              cmd = {
                vim.fs.normalize(vim.fn.stdpath("data") .. "/mason/bin/fsautocomplete"),
              },
              settings = {
                FSharp = {
                },
              },
            },
          },
          -- you can do any additional lsp server setup here
          -- return true if you don't want this server to be setup with lspconfig
          ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
          setup = {
            ionide = function(_, opts)
              -- print("setup ionide")
              require("ionide").setup(opts)
            end,
            -- NOTE: returning true will make sure fsautocomplete is not setup with neovim, which is what we want if we're using Ionide-nvim
            fsautocomplete = function(_, _)
              return true
            end,
          },
        },
      },
    },
  },
}
