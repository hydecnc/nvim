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
      require('mini.pairs').setup()
      require('mini.diff').setup()
      require('mini.files').setup()
      require('mini.icons').setup()

      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
    keys = {
      {
        '<leader>fe',
        function()
          MiniFiles.open()
        end,
        desc = 'Mini Files (cwd)',
      },
      { '<leader>e', '<leader>fe', desc = 'Mini Files (cwd)', remap = true },
    },
  },
}
