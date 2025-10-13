require('lazy').setup({
  require 'plugins.colorscheme',
  require 'plugins.blink-cmp',
  require 'plugins.conform',
  require 'plugins.treesitter',
  require 'plugins.mini',
  require 'plugins.snacks',
  require 'plugins.which-key',
  require 'plugins.todo-comments',
  require 'plugins.lsp',
  require 'plugins.nvim-lspconfig',
  require 'plugins.lint',
  require 'plugins.nvim-dap',
  require 'plugins.nvim-jdtls',
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
