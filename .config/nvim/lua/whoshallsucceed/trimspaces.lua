local function TrimSpaces()
  local line_count = vim.api.nvim_buf_line_count(0)
  local cmd = string.format("1,%ds/\\s\\+$//ge", line_count)
  vim.cmd(cmd)
end

vim.api.nvim_create_user_command('TrimSpaces', TrimSpaces, {})
