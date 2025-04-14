return {
  'tpope/vim-fugitive',
  config = function()
    -- Fugitive keymaps
    vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR><C-w>3+', { desc = '[G]it [S]tatus' })
    vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>', { desc = '[G]it [D]iff' })
    vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { desc = '[G]it [C]ommit' })
    vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = '[G]it [P]ush' })
    vim.keymap.set('n', '<leader>gl', '<cmd>Git pull<CR>', { desc = '[G]it pu[L]l' })
    vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<CR>', { desc = '[G]it [B]lame' })
    vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<CR>', { desc = '[G]it [W]rite (Stage)' })
    vim.keymap.set('n', '<leader>gr', '<cmd>Gread<CR>', { desc = '[G]it [R]ead (Unstage)' })
  end,
}
