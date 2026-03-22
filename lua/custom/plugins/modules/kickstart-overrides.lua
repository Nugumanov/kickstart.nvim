return {
  {
    'neovim/nvim-lspconfig',
    init = function()
      if vim.g.kickstart_disable_stylua_lsp then
        return
      end

      vim.g.kickstart_disable_stylua_lsp = true

      local enable = vim.lsp.enable
      vim.lsp.enable = function(name, ...)
        if name == 'stylua' then
          return
        end

        return enable(name, ...)
      end
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local parsers = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
      local parser_dir = vim.fn.stdpath 'data' .. '/site'
      vim.opt.runtimepath:append(parser_dir)
      require('nvim-treesitter.configs').setup {
        parser_install_dir = parser_dir,
      }
      require('nvim-treesitter.install').ensure_installed(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf, filetype = args.buf, args.match

          local language = vim.treesitter.language.get_lang(filetype)
          if not language then
            return
          end

          if not vim.treesitter.language.add(language) then
            return
          end

          vim.treesitter.start(buf, language)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
