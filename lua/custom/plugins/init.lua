return {
  {
    'tpope/vim-fugitive',
    config = function()
      -- Fugitive keymaps
      vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { desc = '[G]it [S]tatus' })
      vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>', { desc = '[G]it [D]iff' })
      vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { desc = '[G]it [C]ommit' })
      vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = '[G]it [P]ush' })
      vim.keymap.set('n', '<leader>gl', '<cmd>Git pull<CR>', { desc = '[G]it pu[L]l' })
      vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<CR>', { desc = '[G]it [B]lame' })
      vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<CR>', { desc = '[G]it [W]rite (Stage)' })
      vim.keymap.set('n', '<leader>gr', '<cmd>Gread<CR>', { desc = '[G]it [R]ead (Unstage)' })
    end,
  },

  { 'knubie/vim-kitty-navigator' },

  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    build = 'make BUILD_FROM_SOURCE=true',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'echasnovski/mini.pick',
      'nvim-telescope/telescope.nvim',
      'hrsh7th/nvim-cmp',
      'ibhagwan/fzf-lua',
      'nvim-tree/nvim-web-devicons',
      'zbirenbaum/copilot.lua',
      {
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = { file_types = { 'markdown', 'Avante' } },
        ft = { 'markdown', 'Avante' },
      },
    },
    opts = {
      provider = 'deepseek',
      vendors = {
        deepseek = {
          __inherited_from = 'openai',
          api_key_name = 'DEEPSEEK_API_KEY',
          endpoint = 'https://api.deepseek.com',
          model = 'deepseek-coder',
        },
      },

      -- Add RAG configuration here
      rag_service = {
        enabled = true,
        host_mount = '~/Projects/RAG/',
        provider = 'deepseek',
        llm_model = 'deepseek-coder',
        embed_model = 'text-embedding-3-small',
        endpoint = 'https://api.deepseek.com/v1',
      },
      --rag = {
      --  indexes = {
      --    core_tools = {
      --      index_dir = vim.fn.expand '~/Projects/RAG/indexes/core_tools',
      --      patterns = {
      --        include = {
      --          '~/Projects/RAG/documents/tools/**/*.md',
      --          '~/Projects/RAG/documents/tools/**/*.pdf',
      --          '~/Projects/RAG/documents/internal/*.txt',
      --        },
      --        exclude = {
      --          '**/archive/**',
      --          '**/drafts/**',
      --          '**/*.bin',
      --          '**/*.zip',
      --        },
      --      },
      --      chunk_size = 1200,
      --      chunk_overlap = 200,
      --      embedding = {
      --        provider = 'openai',
      --        model = 'text-embedding-3-small',
      --      },
      --    },
      --  },
      --  default_index = 'core_tools',
      --},
      tools = {
        web_search = {
          enabled = true,
          provider = 'tavily',
        },
        repository_actions = {
          enabled = true,
        },
      },
      git = {
        enabled = true,
        root_dir = vim.fn.getcwd(),
      },
    },
    config = function(_, opts)
      require('avante').setup(opts)

      -- Add RAG keymaps
      --vim.keymap.set('n', '<leader>ra', function()
      --  require('avante.ask').ask '@rag '
      --end, { desc = '[R]AG [A]sk' })

      --vim.keymap.set('n', '<leader>rs', function()
      --  require('avante.rag').interactive_search {
      --    index = 'core_tools',
      --    preview = true,
      --  }
      --end, { desc = '[R]AG [S]earch' })

      --vim.keymap.set('n', '<leader>ru', function()
      --  require('avante.rag').index_dir('~/Projects/RAG/documents/tools/', { index = 'core_tools', force = true })
      --  vim.notify('RAG index updated!', vim.log.levels.INFO)
      --end, { desc = '[R]AG [U]pdate' })
    end,
  },
  -- end of avante.nvim

  -- required by avante.nvim to use a web-search
  {
    -- Make sure to set this up properly if you have lazy=true
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { 'markdown', 'Avante' },
    },
    ft = { 'markdown', 'Avante' },
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<c-;>]],
    },
  },

  --  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.
  {
    'sourcegraph/sg.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', --[[ "nvim-telescope/telescope.nvim ]]
    },
  },

  {
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
  },
  {
    'nvim-focus/focus.nvim',
    config = function()
      require('focus').setup {
        enable = true, -- Enable module
        commands = true, -- Create Focus commands
        autoresize = {
          enable = false, -- Enable or disable auto-resizing of splits
          width = 0, -- Force width for the focused window
          height = 0, -- Force height for the focused window
          minwidth = 40, -- Force minimum width for the unfocused window
          minheight = 50, -- Force minimum height for the unfocused window
          height_quickfix = 10, -- Set the height of quickfix panel
        },
        split = {
          bufnew = false, -- Create blank buffer for new split windows
          tmux = false, -- Create tmux splits instead of neovim splits
        },
        ui = {
          number = true, -- Display line numbers in the focussed window only
          relativenumber = true, -- Display relative line numbers in the focussed window only
          hybridnumber = true, -- Display hybrid line numbers in the focussed window only
          absolutenumber_unfocussed = true, -- Preserve absolute numbers in the unfocussed windows

          cursorline = true, -- Display a cursorline in the focussed window only
          cursorcolumn = true, -- Display cursorcolumn in the focussed window only
          colorcolumn = {
            enable = true, -- Display colorcolumn in the foccused window only
            list = '+1', -- Set the comma-saperated list for the colorcolumn
          },
          signcolumn = true, -- Display signcolumn in the focussed window only
          winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
        },
      }
    end,
  },

  {
    'harrisoncramer/gitlab.nvim',
    config_path = '~/gitlab-nvim/.config',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'stevearc/dressing.nvim', -- Recommended but not required. Better UI for pickers.
      'nvim-tree/nvim-web-devicons', -- Recommended but not required. Icons in discussion tree.
    },
    build = function()
      require('gitlab.server').build(true)
    end, -- Builds the Go binary
    config = function()
      require('gitlab').setup()
    end,
  },
  --{
  --  'git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git',
  --  -- Activate when a file is created/opened
  --  event = { 'BufReadPre', 'BufNewFile' },
  --  -- Activate when a supported filetype is open
  --  ft = { 'go', 'javascript', 'python', 'ruby' },
  --  cond = function()
  --    -- Only activate if token is present in environment variable.
  --    -- Remove this line to use the interactive workflow.
  --    return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ''
  --  end,
  --  opts = {
  --    statusline = {
  --      -- Hook into the built-in statusline to indicate the status
  --      -- of the GitLab Duo Code Suggestions integration
  --      enabled = true,
  --    },
  --  },
  --},

  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'Globble',
          path = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Globble',
        },
      },
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

  {
    'CRAG666/betterTerm.nvim',
    opts = {
      position = 'bot',
      size = 15,
    },
  },
}
