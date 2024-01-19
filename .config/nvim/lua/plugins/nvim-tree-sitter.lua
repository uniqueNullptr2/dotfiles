local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    opts= {
      ensure_installed={"c", "rust", "go", "typescript", "javascript", "angular"},
      highlight = {
        enable=true,
      },
      autotag = {
          enable = true,
      }
    },
    config = function(plugin, opts)
        require 'nvim-treesitter.configs'.setup(opts)
    end,
}

return { M }
