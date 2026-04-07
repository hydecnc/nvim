vim.pack.add {
  'https://github.com/rebelot/kanagawa.nvim',
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-mini/mini.nvim',
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
  'https://github.com/stevearc/conform.nvim',
}

vim.cmd.colorscheme 'kanagawa'

require('mini.extra').setup()
require('mini.icons').setup()
require('mini.diff').setup()

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

  -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --
  -- See the fuzzy documentation for more information
  fuzzy = { implementation = 'prefer_rust_with_warning' },
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
