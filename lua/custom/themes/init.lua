return {
  --{
  --  'folke/tokyonight.nvim',
  --  priority = 1000, -- Make sure to load this before all the other start plugins.
  --  init = function()
  --    vim.cmd.colorscheme 'tokyonight-night'
  --    -- You can configure highlights by doing something like:
  --    vim.cmd.hi 'Comment gui=none' end,
  --},

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato',
        integrations = {
          neotree = true,
        },
      }
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd.hi 'Comment gui=none'
    end,

    init = function()
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
