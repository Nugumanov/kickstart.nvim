-- keymaps.lua
--
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keybinds to resize windows
vim.keymap.set('n', '<C-left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })
vim.keymap.set('n', '<C-down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })

-- Tabby
vim.keymap.set('n', '<leader>ta', ':$tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { desc = 'Tab only ?? idk' })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>tmp', ':-tabmove<CR>', { desc = 'Move tab left' })
vim.keymap.set('n', '<leader>tmn', ':+tabmove<CR>', { desc = 'Move tab right' })
vim.keymap.set('n', '<leader>tr', ':Tabby rename_tab', { desc = 'Rename right' })

vim.keymap.set('n', '<left>', ':tabp<CR>')
vim.keymap.set('n', '<right>', ':tabn<CR>')

--vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
--vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- sshfs
--local api = require 'remote-sshfs.api'
--vim.keymap.set('n', '<leader>rc', api.connect, {})
--vim.keymap.set('n', '<leader>rd', api.disconnect, {})
--vim.keymap.set('n', '<leader>re', api.edit, {})
--
---- (optional) Override telescope find_files and live_grep to make dynamic based on if connected to host
--local builtin = require 'telescope.builtin'
--local connections = require 'remote-sshfs.connections'
--vim.keymap.set('n', '<leader>ff', function()
--  if connections.is_connected() then
--    api.find_files()
--  else
--    builtin.find_files()
--  end
--end, {})
--vim.keymap.set('n', '<leader>fg', function()
--  if connections.is_connected() then
--    api.live_grep()
--  else
--    builtin.live_grep()
--  end
--end, {})
