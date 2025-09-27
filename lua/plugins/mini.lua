return {
  {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup {
        mappings = {
          add = 'gsa', -- Add surrounding in Normal and Visual modes
          delete = 'gsd', -- Delete surrounding
          find = 'gsf', -- Find surrounding (to the right)
          find_left = 'gsF', -- Find surrounding (to the left)
          highlight = 'gsh', -- Highlight surrounding
          replace = 'gsr', -- Replace surrounding
          update_n_lines = 'gsn', -- Update `n_lines`
        },
      }
      require('mini.pairs').setup {
        mappings = { ['$'] = { action = 'closeopen', pair = '$$', neigh_pattern = '[^\\].', register = { cr = false } } },
      }
      require('mini.icons').setup()
      require('mini.diff').setup()
      require('mini.jump').setup { delay = { highlight = 0 } }

      require('mini.files').setup()
      MiniFilesToggle = function(...)
        if not MiniFiles.close() then
          MiniFiles.open(...)
        end
      end

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
    keys = {
      {
        '<leader>fe',
        function()
          MiniFilesToggle()
        end,
        desc = 'Mini Files (cwd)',
      },
      { '<leader>e', '<leader>fe', desc = 'Mini Files (cwd)', remap = true },
    },
  },
}
