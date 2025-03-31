return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      columns = { 'icon' },
      watch_for_changes = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['-'] = false,
        ['<C-r>'] = 'actions.refresh',
        ['<BS>'] = 'actions.parent',
        ['g?'] = 'actions.show_help',
      },
    }
  end,

  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  --dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  event = 'VimEnter',
}
