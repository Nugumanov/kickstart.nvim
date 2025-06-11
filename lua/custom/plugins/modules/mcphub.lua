return {
  'ravitemer/mcphub.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  build = 'bundled_build.lua', -- Bundles `mcp-hub` binary along with the neovim plugin
  config = function()
    require('mcphub').setup {
      use_bundled_binary = true, -- Use local `mcp-hub` binary

      port = 3000, -- Default hub port
      config = vim.fn.expand '~/.config/mcphub/servers.json', -- Absolute path required

      -- Optional customization
      log = {
        level = vim.log.levels.WARN, -- DEBUG, INFO, WARN, ERROR
        to_file = true, -- Creates ~/.local/state/nvim/mcphub.log
      },
      on_ready = function()
        vim.notify 'MCP Hub is online!'
      end,
    }
  end,
}
