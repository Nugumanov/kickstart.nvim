return {
  { import = 'custom/plugins/modules/vim-fugitive' },
  { import = 'custom/plugins/modules/avante' },
  { import = 'custom/plugins/modules/toggleterm' },
  --{ import = 'custom/plugins/modules/focus' },
  { import = 'custom/plugins/modules/obsidian' },
  --{ import = 'custom/plugins/modules/oil' },
  --{ import = 'custom/plugins/modules/gitlab' },
  { import = 'custom/plugins/modules/vimade' },
  { import = 'custom/plugins/modules/tabby' },
  { import = 'custom/plugins/modules/markdown-preview' },
  { import = 'custom/plugins/modules/remote-sshfs' },
  { import = 'custom/plugins/modules/mcphub' },

  { 'knubie/vim-kitty-navigator' },

  --  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.
  {
    'sourcegraph/sg.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', --[[ "nvim-telescope/telescope.nvim ]]
    },
  },
}
