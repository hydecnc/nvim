return {
  {
    'nvim-mini/mini.nvim',
    event = 'InsertEnter',
    dependencies = 'rafamadriz/friendly-snippets',
    config = function()
      local mini_snippets = require 'mini.snippets'
      mini_snippets.setup {
        snippets = { mini_snippets.gen_loader.from_lang() },
      }
    end,
  },
}
