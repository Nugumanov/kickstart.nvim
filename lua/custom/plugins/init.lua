return {
  { import = 'custom/plugins/modules/vim-fugitive' },
  { import = 'custom/plugins/modules/avante' },
  { import = 'custom/plugins/modules/toggleterm' },
  { import = 'custom/plugins/modules/focus' },
  { import = 'custom/plugins/modules/obsidian' },
  { import = 'custom/plugins/modules/oil' },
  { import = 'custom/plugins/modules/gitlab' },

  { 'knubie/vim-kitty-navigator' },

  --  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.
  {
    'sourcegraph/sg.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', --[[ "nvim-telescope/telescope.nvim ]]
    },
  },

  -- install with yarn or npm
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
