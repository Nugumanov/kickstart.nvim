return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<c-\>]],
    autochdir = true,
    direction = 'float',
    winbar = {
      enabled = false,
    },
    shade_terminals = true,
    shading_factor = 50,
    shading_ratio = 30,
    start_in_insert = true,
    float_opts = {
      border = 'single',
      width = 155,
      height = 46,
      row = 6,
      col = 20,
      winblend = 30,
      --zindex = 999,
    },
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  },
}
