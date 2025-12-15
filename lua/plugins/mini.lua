return {
  {
    'nvim-mini/mini.nvim',
    event = 'VeryLazy',
    dependencies = 'rafamadriz/friendly-snippets',
    config = function()
      require('mini.extra').setup()

      local ai = require 'mini.ai'
      ai.setup {
        custom_textobjects = {
          B = MiniExtra.gen_ai_spec.buffer(),
          F = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
          C = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' },
        },
        search_method = 'cover',
      }

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
      require('mini.icons').setup()
      require('mini.diff').setup()
      require('mini.jump').setup { delay = { highlight = 0 } }

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      local gen_loader = require('mini.snippets').gen_loader
      require('mini.snippets').setup {
        snippets = {
          gen_loader.from_file '~/.config/nvim/snippets/global.json',
          gen_loader.from_lang(),
        },
      }

      require('mini.pick').setup()
    end,
    keys = {
      {
        '<leader>fe',
        function()
          require('mini.files').open()
        end,
        desc = 'Mini Files (cwd)',
      },
      { '<leader>e', '<leader>fe', desc = 'Mini Files (cwd)', remap = true },
      { '<leader>ff', '<Cmd>Pick files<CR>', desc = 'Mini Files (cwd)' },
      { 'f/', '<Cmd>Pick history scope="/"<CR>', desc = '"/" history' },
      { '<leader>f:', '<Cmd>Pick history scope=":"<CR>', desc = '":" history' },
      { '<leader>fa', '<Cmd>Pick git_hunks scope="staged"<CR>', desc = 'Added hunks (all)' },
      { '<leader>fA', '<Cmd>Pick git_hunks path="%" scope="staged"<CR>', desc = 'Added hunks (buf)' },
      { '<leader>fb', '<Cmd>Pick buffers<CR>', desc = 'Buffers' },
      { '<leader>fc', '<Cmd>Pick git_commits<CR>', desc = 'Commits (all)' },
      { '<leader>fC', '<Cmd>Pick git_commits path="%"<CR>', desc = 'Commits (buf)' },
      { '<leader>fd', '<Cmd>Pick diagnostic scope="all"<CR>', desc = 'Diagnostic workspace' },
      { '<leader>fD', '<Cmd>Pick diagnostic scope="current"<CR>', desc = 'Diagnostic buffer' },
      { '<leader>ff', '<Cmd>Pick files<CR>', desc = 'Files' },
      { '<leader>fg', '<Cmd>Pick grep_live<CR>', desc = 'Grep live' },
      { '<leader>fG', '<Cmd>Pick grep pattern="<cword>"<CR>', desc = 'Grep current word' },
      { '<leader>fh', '<Cmd>Pick help<CR>', desc = 'Help tags' },
      { '<leader>fH', '<Cmd>Pick hl_groups<CR>', desc = 'Highlight groups' },
      { '<leader>fl', '<Cmd>Pick buf_lines scope="all"<CR>', desc = 'Lines (all)' },
      { '<leader>fL', '<Cmd>Pick buf_lines scope="current"<CR>', desc = 'Lines (buf)' },
      { '<leader>fm', '<Cmd>Pick git_hunks<CR>', desc = 'Modified hunks (all)' },
      { '<leader>fM', '<Cmd>Pick git_hunks path="%"<CR>', desc = 'Modified hunks (buf)' },
      { '<leader>fr', '<Cmd>Pick resume<CR>', desc = 'Resume' },
      { '<leader>fR', '<Cmd>Pick lsp scope="references"<CR>', desc = 'References (LSP)' },
      { '<leader>fs', '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>', desc = 'Symbols workspace (live)' },
      { '<leader>fS', '<Cmd>Pick lsp scope="document_symbol"<CR>', desc = 'Symbols document' },
      { '<leader>fv', '<Cmd>Pick visit_paths cwd=""<CR>', desc = 'Visit paths (all)' },
      { '<leader>fV', '<Cmd>Pick visit_paths<CR>', desc = 'Visit paths (cwd)' },
    },
  },
}
