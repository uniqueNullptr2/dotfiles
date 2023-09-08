return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
            width = 30,
        },
        sync_root_with_cwd = true,
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
    })

    local api = require "nvim-tree.api"
    vim.keymap.set('n', '<leader>b', api.tree.toggle, {desc="nvim-tree toggle"})

 end,
}
