return {
    {
      'akinsho/toggleterm.nvim',
      version = "*",
      keys = { 
          {[[<C-\>]]},
          {"<esc>", [[<C-\><C-n>]], mode = {"t"}, desc = "normal mode terminal"},
      },
      opts = {
          open_mapping = [[<C-\>]],
          size = 20,
          direction = "float",
          shade_terminal=true,
          shading_factor = 2,
          start_in_insert = true,
          close_on_exit = true,
          float_opts = {
              border = "curved",
              winblend = 0,
              highlights = {
                  border = "Normal",
                  background = "Normal",
              },
          },
        },
    }
}
