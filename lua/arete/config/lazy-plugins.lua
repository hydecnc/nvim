require('lazy').setup({
  require 'arete.plugins.colorscheme',
  require 'arete.plugins.blink-cmp',
  require 'arete.plugins.conform',
  require 'arete.plugins.treesitter',
  require 'arete.plugins.snacks',
  require 'arete.plugins.mini',
  require 'arete.plugins.which-key',
  require 'arete.plugins.lsp',
  require 'arete.plugins.nvim-lspconfig',
}, {
  checker = {
    enabled = false,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        -- 'matchit',
        -- 'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
-- vim: ts=2 sts=2 sw=2 et
