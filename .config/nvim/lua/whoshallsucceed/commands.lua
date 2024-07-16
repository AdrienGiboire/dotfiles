vim.api.nvim_create_autocmd('FileType', {
  pattern = 'vue',
  callback = function()
    vim.fn.setpos("'c", { 0, vim.fn.search('^  computed:', 'n'), 1, 0 })
    vim.fn.setpos("'d", { 0, vim.fn.search('^  data ()', 'n'), 1, 0 })
    vim.fn.setpos("'i", { 0, vim.fn.search('^import', 'n'), 1, 0 })
    vim.fn.setpos("'m", { 0, vim.fn.search('^methods', 'n'), 1, 0 })
    vim.fn.setpos("'p", { 0, vim.fn.search('^props', 'n'), 1, 0 })
    vim.fn.setpos("'w", { 0, vim.fn.search('^watch', 'n'), 1, 0 })
  end
})
