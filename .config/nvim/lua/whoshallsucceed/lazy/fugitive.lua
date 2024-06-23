return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<Leader>gs', vim.cmd.Git)
    vim.keymap.set('n', '<Leader>gb', ':Git blame<CR>')
    vim.keymap.set('n', '<Leader>gu', '<cmd>diffget //2<CR>')
    vim.keymap.set('n', '<Leader>gh', '<cmd>diffget //3<CR>')
  end,
}
