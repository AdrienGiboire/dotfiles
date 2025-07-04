return {
  -- Docker-aware LSP setup for Rails projects using devcontainer
  {
    'neovim/nvim-lspconfig',
    ft = { 'ruby', 'erb', 'slim' },
    config = function()
      local lspconfig = require('lspconfig')
      
      -- Function to check if we're in a devcontainer Rails project
      local function is_devcontainer_rails_project()
        return vim.fn.filereadable('.devcontainer/docker-compose.yml') == 1 and 
               vim.fn.filereadable('Gemfile') == 1
      end
      
      -- Setup Docker-based Solargraph for Ruby LSP
      local function setup_docker_solargraph()
        lspconfig.solargraph.setup({
          cmd = {
            'docker-compose', '-f', '.devcontainer/docker-compose.yml', 
            'exec', '-T', 'web',
            'bundle', 'exec', 'solargraph', 'stdio'
          },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
          settings = {
            solargraph = {
              diagnostics = true,
              completion = true,
              hover = true,
              formatting = true,
              symbols = true,
              definitions = true,
              rename = true,
              references = true,
              folding = true,
              useBundler = true,
              -- Exclude common directories that don't need analysis
              exclude = {
                "**/node_modules/**",
                "**/vendor/**",
                "**/tmp/**",
                "**/log/**",
                "**/public/**",
                "**/.git/**",
                "**/.devcontainer/**"
              }
            }
          },
          on_attach = function(client, bufnr)
            -- LSP key mappings
            local opts = { noremap = true, silent = true, buffer = bufnr }
            
            -- Go to definition
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            
            -- Hover documentation
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            
            -- Show signature help
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            
            -- Rename symbol
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            
            -- Code actions
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            
            -- Go to references
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            
            -- Format document
            vim.keymap.set('n', '<leader>f', function()
              vim.lsp.buf.format({ async = true })
            end, opts)
            
            -- Show diagnostics in floating window
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
            
            -- Go to next/previous diagnostic
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            
            -- Show all diagnostics in quickfix
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
            
            print("Docker-based Solargraph LSP attached to buffer " .. bufnr)
          end,
          on_exit = function(code, signal, client_id)
            if code ~= 0 then
              print("Solargraph exited with code " .. code .. ". Make sure Docker containers are running:")
              print("  docker-compose -f .devcontainer/docker-compose.yml up -d")
            end
          end,
        })
      end
      
      -- Auto-setup Solargraph when opening Ruby files in devcontainer projects
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "ruby",
        callback = function()
          if is_devcontainer_rails_project() then
            -- Small delay to ensure Docker services are ready
            vim.defer_fn(function()
              setup_docker_solargraph()
            end, 1000)
          end
        end,
      })
      
      -- Command to manually restart Docker LSP
      vim.api.nvim_create_user_command('DockerLspRestart', function()
        if is_devcontainer_rails_project() then
          vim.cmd('LspRestart')
          print("Restarting Docker-based LSP...")
        else
          print("Not in a devcontainer Rails project")
        end
      end, { desc = 'Restart Docker-based LSP server' })
      
      -- Command to check if Docker services are running
      vim.api.nvim_create_user_command('DockerStatus', function()
        if is_devcontainer_rails_project() then
          vim.cmd('terminal docker-compose -f .devcontainer/docker-compose.yml ps')
        else
          print("Not in a devcontainer Rails project")
        end
      end, { desc = 'Check Docker container status' })
      
      -- Command to start Docker services
      vim.api.nvim_create_user_command('DockerStart', function()
        if is_devcontainer_rails_project() then
          vim.cmd('terminal docker-compose -f .devcontainer/docker-compose.yml up -d')
        else
          print("Not in a devcontainer Rails project")
        end
      end, { desc = 'Start Docker services' })
      
      -- Command to check Docker LSP status
      vim.api.nvim_create_user_command('DockerLspStatus', function()
        if is_devcontainer_rails_project() then
          vim.cmd('LspInfo')
        else
          print("Not in a devcontainer Rails project")
        end
      end, { desc = 'Show Docker LSP status' })
      
      -- Key mappings for Docker and LSP management
      vim.keymap.set('n', '<leader>li', ':LspInfo<CR>', { desc = 'LSP Info' })
      vim.keymap.set('n', '<leader>lr', ':DockerLspRestart<CR>', { desc = 'Restart Docker LSP' })
      vim.keymap.set('n', '<leader>dst', ':DockerStatus<CR>', { desc = 'Docker Status' })
      vim.keymap.set('n', '<leader>dst', ':DockerStart<CR>', { desc = 'Start Docker Services' })
    end,
  },
}
