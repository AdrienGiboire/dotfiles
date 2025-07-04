return {
  -- Core Rails support
  {
    'tpope/vim-rails',
    ft = { 'ruby', 'eruby', 'haml', 'slim' },
    dependencies = {
      'tpope/vim-bundler',
      'tpope/vim-projectionist',
    },
    config = function()
      -- Rails-specific key mappings for Docker environment
      vim.keymap.set('n', '<leader>rc', ':terminal docker-compose -f .devcontainer/docker-compose.yml exec web bundle exec rails console<CR>', 
        { desc = 'Rails console in Docker' })
      vim.keymap.set('n', '<leader>rs', ':terminal docker-compose -f .devcontainer/docker-compose.yml up web<CR>', 
        { desc = 'Start Rails server in Docker' })
      vim.keymap.set('n', '<leader>rg', ':terminal docker-compose -f .devcontainer/docker-compose.yml exec web bundle exec rails generate ', 
        { desc = 'Rails generate in Docker' })
      vim.keymap.set('n', '<leader>rd', ':terminal docker-compose -f .devcontainer/docker-compose.yml exec web bundle exec rails destroy ', 
        { desc = 'Rails destroy in Docker' })
      vim.keymap.set('n', '<leader>rm', ':terminal docker-compose -f .devcontainer/docker-compose.yml exec web bundle exec rails db:migrate<CR>', 
        { desc = 'Rails DB migrate in Docker' })
      vim.keymap.set('n', '<leader>rr', ':terminal docker-compose -f .devcontainer/docker-compose.yml exec web bundle exec rails db:rollback<CR>', 
        { desc = 'Rails DB rollback in Docker' })
      vim.keymap.set('n', '<leader>rt', ':terminal docker-compose -f .devcontainer/docker-compose.yml exec web bundle exec rails test<CR>', 
        { desc = 'Rails test in Docker' })
      
      -- Docker-specific commands
      vim.keymap.set('n', '<leader>dc', ':terminal docker-compose -f .devcontainer/docker-compose.yml ', 
        { desc = 'Docker compose command' })
      vim.keymap.set('n', '<leader>ds', ':terminal docker-compose -f .devcontainer/docker-compose.yml up -d<CR>', 
        { desc = 'Start Docker services' })
      vim.keymap.set('n', '<leader>dd', ':terminal docker-compose -f .devcontainer/docker-compose.yml down<CR>', 
        { desc = 'Stop Docker services' })
      vim.keymap.set('n', '<leader>dr', ':terminal docker-compose -f .devcontainer/docker-compose.yml restart web<CR>', 
        { desc = 'Restart Rails container' })
      vim.keymap.set('n', '<leader>dl', ':terminal docker-compose -f .devcontainer/docker-compose.yml logs -f web<CR>', 
        { desc = 'Follow Docker logs' })
      
      -- Asset compilation using Docker
      vim.keymap.set('n', '<leader>ac', ':terminal docker-compose -f .devcontainer/docker-compose.yml exec web bundle exec rails assets:precompile<CR>', 
        { desc = 'Precompile assets in Docker' })
      vim.keymap.set('n', '<leader>ax', ':terminal docker-compose -f .devcontainer/docker-compose.yml exec web bundle exec rails assets:clobber<CR>', 
        { desc = 'Clear assets in Docker' })
      
      -- Ruby formatting using Docker-based RuboCop
      vim.keymap.set('n', '<leader>rf', function()
        local current_file = vim.fn.expand('%')
        vim.cmd('terminal docker-compose -f .devcontainer/docker-compose.yml exec web bundle exec rubocop -a ' .. current_file)
      end, { desc = 'Format Ruby file with RuboCop in Docker' })
      
      -- Quick access to container shell
      vim.keymap.set('n', '<leader>sh', ':terminal docker-compose -f .devcontainer/docker-compose.yml exec web bash<CR>', 
        { desc = 'Open shell in web container' })
      
      -- Rails navigation shortcuts (vim-rails built-ins)
      vim.keymap.set('n', '<leader>ra', ':A<CR>', { desc = 'Alternate file' })
      vim.keymap.set('n', '<leader>rA', ':AS<CR>', { desc = 'Alternate file in split' })
      vim.keymap.set('n', '<leader>rv', ':AV<CR>', { desc = 'Alternate file in vertical split' })
      
      -- Quick access to important Rails files
      vim.keymap.set('n', '<leader>fr', ':edit config/routes.rb<CR>', { desc = 'Open routes.rb' })
      vim.keymap.set('n', '<leader>fg', ':edit Gemfile<CR>', { desc = 'Open Gemfile' })
      vim.keymap.set('n', '<leader>fs', ':edit db/schema.rb<CR>', { desc = 'Open schema.rb' })
      vim.keymap.set('n', '<leader>fe', ':edit .env<CR>', { desc = 'Open .env' })
      vim.keymap.set('n', '<leader>fd', ':edit config/database.yml<CR>', { desc = 'Open database.yml' })
    end,
  },
  
  -- Slim template support
  {
    'slim-template/vim-slim',
    ft = 'slim',
  },
  
  -- Better Ruby syntax highlighting
  {
    'vim-ruby/vim-ruby',
    ft = 'ruby',
    config = function()
      -- Ruby-specific settings
      vim.g.ruby_indent_assignment_style = 'variable'
      vim.g.ruby_indent_block_style = 'do'
    end,
  },
}
