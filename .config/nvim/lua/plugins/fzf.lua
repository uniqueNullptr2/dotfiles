return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
      {"<leader>g", "<cmd>FzfLua live_grep<cr>", desc="live grep"}
  },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end
}
