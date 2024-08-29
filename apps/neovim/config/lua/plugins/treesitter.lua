return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },

      custom_parsers = {
        zsh = {
          install_info = {
            url = "https://github.com/tree-sitter-grammars/tree-sitter-zsh.git",
            files = { "src/parser.c", "src/scanner.c" },
            generate_requires_npm = false,
            requires_generate_from_grammar = false
          }
        }
      },

      ensure_installed = {
        "bash",
        "zsh",

        "html",
        "css",

        "python",
        "rust",
        "c",
        "cpp",
        "javascript",
        "typescript",
        "lua",

        "json",
        "json5",
        "toml",
        "xml",
        "yaml",

        "markdown",
        "markdown_inline",

        "dockerfile",

        "vim"
      },
      sync_install = false,  -- install parsers asynchronously
      auto_install = true,

      --[[incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "tnn",
          node_incremental = "tni",
          scope_incremental = "tsi",
          node_decremental = "tnd",
        },
      },--]]
    },
    config = function(_, opts)
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

      if (opts.custom_parsers ~= nil) then
        for k, v in pairs(opts.custom_parsers) do
          parser_config[k] = v
        end
      end

      require("nvim-treesitter.configs").setup(opts)
    end
  },
}
