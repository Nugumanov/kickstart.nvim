return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat' },
        lualine_y = { '' },
        lualine_z = { 'location' },
        --lualine_y = { 'progress' },
        --lualine_z = { 'location' },
      },
      winbar = {},
      tabline = {
        --lualine_a = { 'buffers' },
        --lualine_b = {},
        --lualine_c = {},
        --lualine_x = {},
        --lualine_y = {},
        --lualine_z = { 'tabs' },
      },
    }
  end,
}
