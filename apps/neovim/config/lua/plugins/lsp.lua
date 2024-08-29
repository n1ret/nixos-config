return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      -- TSServer
      lspconfig.tsserver.setup({})
      
      -- Rust-analyzer
      lspconfig.rust_analyzer.setup {
        settings = {
          ['rust-analyzer'] = {},
        },
      }

      -- Ruff linter
      lspconfig.ruff_lsp.setup {
        init_options = {
          settings = {
            args = {
              "--select=E,F,UP,N,I,ASYNC,S,PTH",
              "--line-length=79",
              "--respect-gitignore",  -- Exclude files mathing .gitignore
              "--target-version=py311"
            },
          }
        }
      }
    end,
    keys = {
      { "<leader>e", vim.diagnostic.open_float },
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  }
}
