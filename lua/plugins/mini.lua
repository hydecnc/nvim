return {
  {
    'nvim-mini/mini.nvim',
    event = 'VeryLazy',
    dependencies = 'rafamadriz/friendly-snippets',
    config = function()
      require('mini.extra').setup()
      require('mini.icons').setup()
      require('mini.diff').setup()

      local ai = require 'mini.ai'
      ai.setup {
        custom_textobjects = {
          B = MiniExtra.gen_ai_spec.buffer(),
          F = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
          C = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' },
          o = ai.gen_spec.treesitter {
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
          },
        },
        search_method = 'cover',
      }

      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.jump').setup { delay = { highlight = 0 } }

      local hipatterns = require 'mini.hipatterns'
      local hi_words = MiniExtra.gen_highlighter.words
      hipatterns.setup {
        highlighters = {
          -- Highlight a fixed set of common words. Will be highlighted in any place,
          -- not like "only in comments".
          fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
          hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
          todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
          note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

          -- Highlight hex color string (#aabbcc) with that color as a background
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }

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
      -- stylua: ignore start
      { 'gd', function() vim.lsp.buf.definition() end, desc = 'Goto Definition' },
      { 'gD', function() vim.lsp.buf.declaration() end, desc = 'Goto Declaration' },
      { 'gr', function() vim.lsp.buf.references() end, nowait = true, desc = 'References' },
      { 'gI', function() vim.lsp.buf.implementation() end, desc = 'Goto Implementation' },
      { 'gy', function() vim.lsp.buf.type_definition() end, desc = 'Goto T[y]pe Definition' },
      { 'bd', function() require('mini.bufremove').delete() end, desc = 'Delete Buffer' },
      { 'bD', function() require('mini.bufremove').delete() end, desc = 'Delete! Buffer' },
      -- stylua: ignore end
    },
  },
}
