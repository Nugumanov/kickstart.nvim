return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      -- Read theme state from kitty toggle script
      local function get_flavour()
        local state_file = vim.fn.expand('~/.config/kitty/.theme')
        if vim.fn.filereadable(state_file) == 1 then
          local line = vim.fn.readfile(state_file)[1]
          if line == 'light' then return 'latte' end
        end
        return 'macchiato' -- default: dark
      end

      local function apply_theme()
        local flavour = get_flavour()
        require('catppuccin').setup {
          flavour = flavour,
          transparent_background = true,
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
      end

      apply_theme()

      -- Re-apply theme when kitty's toggle-theme.sh switches while nvim is open
      vim.api.nvim_create_autocmd('FocusGained', {
        callback = apply_theme,
        desc = 'Sync catppuccin flavour with kitty theme state file',
      })
    end,

    init = function()
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
