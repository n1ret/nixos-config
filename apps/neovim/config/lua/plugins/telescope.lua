return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    keys = {
      {"<leader>fp", function() require("telescope.builtin").find_files() end},
      {"<leader>fg", function() require("telescope.builtin").git_files() end},
      {"<leader>ft", function() require("telescope.builtin").live_grep() end}
    }
  }
}
