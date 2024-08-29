-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    "pixelastic/vim-undodir-tree", -- Will this work? It's really old
  { -- File tree
    'nvim-tree/nvim-tree.lua',
    config = function()
      local function my_on_attach(bufnr)
        local api = require 'nvim-tree.api'

        api.config.mappings.default_on_attach(bufnr)
      end

      require('nvim-tree').setup {
        on_attach = my_on_attach,
      }
    end,
  },

  { -- Buffer line
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}

      vim.keymap.set('n', '<S-Left>', ':BufferLineCyclePrev<CR>', { silent = true })
      vim.keymap.set('n', '<S-Right>', ':BufferLineCycleNext<CR>', { silent = true })
      vim.keymap.set('n', '<S-Tab>', ':BufferLineMovePrev<CR>', { silent = true })
      vim.keymap.set('n', '<Tab>', ':BufferLineMoveNext<CR>', { silent = true })
      vim.keymap.set('n', '<leader>bc', ':bd<CR>')
    end,
  },

  { -- Copilot
    'zbirenbaum/copilot.lua',
    config = function()
      require('copilot').setup {
        filetypes = {
          rust = false,
        },
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<M-l>',
          },
        },
      }
    end,
  },

  { -- Rust utilities
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    dependencies = {
      {
        'saecki/crates.nvim',
        tag = 'stable',
        event = { 'BufRead Cargo.toml' },
        config = function()
          require('crates').setup {}
        end,
      },
    },
  },
}
