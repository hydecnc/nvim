vim.pack.add {
  'https://github.com/rebelot/kanagawa.nvim',
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-mini/mini.nvim',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
  'https://github.com/stevearc/conform.nvim',
}

require('vim._core.ui2').enable {}

require('kanagawa').setup {
  transparent = true, -- do not set background color
  theme = 'wave', -- Load "wave" theme
}
vim.cmd.colorscheme 'kanagawa'

-- setup must be called before loading
vim.cmd 'colorscheme kanagawa'

require('mini.extra').setup()
require('mini.icons').setup()
require('mini.diff').setup()
require('mini.pick').setup()
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

local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup {
  snippets = {
    gen_loader.from_file '~/.config/nvim/snippets/global.json',
    gen_loader.from_lang(),
  },
}

require('blink.cmp').setup {
  keymap = { preset = 'default' },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
  },

  -- (Default) Only show the documentation popup when manually triggered
  completion = { documentation = { auto_show = false } },

  -- Default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },

  signature = { enabled = true },
}

require('conform').setup {
  default_format_opts = {
    -- Allow formatting from LSP server if no dedicated formatter is available
    lsp_format = 'fallback',
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  -- Map of filetype to formatters
  -- Make sure that necessary CLI tool is available
  formatters_by_ft = {
    lua = { 'stylua' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
  },
}
