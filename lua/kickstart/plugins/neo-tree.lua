-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    bind_to_cwd = true,

    event_handlers = {
      --{
      --  event = 'file_opened',
      --  handler = function()
      --    vim.cmd 'Neotree close'
      --  end,
      --},
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.opt_local.number = true
          vim.opt_local.relativenumber = true

          ---- Track window instead of buffer
          --local win = vim.api.nvim_get_current_win()
          --vim.api.nvim_create_autocmd('WinLeave', {
          --  buffer = vim.api.nvim_get_current_buf(),
          --  callback = function()
          --    vim.opt_local.relativenumber = false
          --    vim.opt_local.number = false
          --  end,
          --  once = true,
          --})
        end,
      },
    },

    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_hidden = false,
        hide_gitignored = false,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      window = {
        position = 'float',
        mappings = {
          ['\\'] = 'close_window',
          ['oa'] = 'avante_add_files', -- avante.nvim add files/folder to Avante Selected Files
        },
      },

      -- The following setup is for avante.nvim integration
      commands = {
        avante_add_files = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local relative_path = require('avante.utils').relative_path(filepath)

          local ok, sidebar = pcall(require('avante').get)
          if not ok or not sidebar then
            vim.notify('Failed to initialize Avante sidebar', vim.log.levels.ERROR)
            return
          end

          local open = sidebar:is_open()
          -- ensure avante sidebar is open
          if not open then
            ok = pcall(require('avante.api').ask)
            if not ok then
              vim.notify('Failed to open Avante sidebar', vim.log.levels.ERROR)
              return
            end
            sidebar = require('avante').get()
          end

          ok = pcall(sidebar.file_selector.add_selected_file, sidebar.file_selector, relative_path)
          if not ok then
            vim.notify('Failed to add file to Avante', vim.log.levels.ERROR)
            return
          end

          -- remove neo tree buffer
          if not open then
            pcall(sidebar.file_selector.remove_selected_file, sidebar.file_selector, 'neo-tree filesystem [1]')
          end
        end,
        -- end of avante.nvim integration
      },
    },
  },
}
