-- options.lua
--
-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

vim.opt.showmode = false

-- This is needed by markdown plugin
vim.opt.conceallevel = 1

--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2c2c2c' }) -- Example background color

-- Configure cursor appearance and blinking
vim.opt.guicursor = 'n-v-c-sm:block-Cursor/lCursor-blinkwait175-blinkoff150-blinkon175'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

-- Winbar statusline
vim.opt.winbar = '%=%m %f'

-- Tabby save and restore session
vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
