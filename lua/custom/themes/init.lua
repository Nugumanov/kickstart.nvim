return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato',
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          neotree = true,
          barbar = true,
          copilot_vim = true,
        },
        dim_inactive = {
          enabled = false,
          shade = 'dark',
          percentage = 0.05,
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
