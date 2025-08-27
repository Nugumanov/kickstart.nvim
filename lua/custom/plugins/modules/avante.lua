return {
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

    -- system_prompt as function ensures LLM always has latest MCP server state
    -- This is evaluated for every message, even in existing chats
    system_prompt = function()
      local hub = require('mcphub').get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ''
    end,
    -- Using function prevents requiring mcphub before it's loaded
    custom_tools = function()
      return {
        require('mcphub.extensions.avante').mcp_tool(),
      }
    end,

    opts = {
      provider = 'deepseek',
      vendors = {
        deepseek = {
          __inherited_from = 'openai',
          api_key_name = 'DEEPSEEK_API_KEY',
          endpoint = 'https://api.deepseek.com',
          model = 'deepseek-coder',
          -- Add DeepSeek-specific token limits
          max_tokens = 4096, -- Reduced from default OpenAI values
          context_window = 8192, -- Matches DeepSeek's maximum context length
          temperature = 0.7,
        },
      },

      windows = {
        sidebar_header = {
          enabled = false,
        },
        ask = {
          start_insert = false,
        },
      },

      llm = {
        truncate_prompt = true,
        max_input_tokens = 6144, -- Leave room for response (8192 - 2048)
        token_buffer = 128, -- Safety margin
      },

      -- Add RAG configuration here
      --rag_service = {
      --   enabled = true,
      --   host_mount = '~/Projects/RAG/',
      --   provider = 'deepseek',
      --   llm_model = 'deepseek-coder',
      --   embed_model = 'text-embedding-3-small',
      --   endpoint = 'https://api.deepseek.com/v1',
      -- },

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
          max_tokens = 1024, -- Add token limit for web search responses
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
  --
  -- required by avante.nvim to use a web-search
  {
    -- Make sure to set this up properly if you have lazy=true
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { 'markdown', 'Avante' },
    },
    ft = { 'markdown', 'Avante' },
  },
}
