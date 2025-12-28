return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        'nvim-dap-ui',
      },
    },
  },
  {
    'mason-org/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      ensure_installed = {},
    },
    automatic_enable = {
      exclude = {
        'jdtls',
      },
    },
    dependencies = {
      { 'mason-org/mason.nvim', opts = { PATH = 'append' } },
      'neovim/nvim-lspconfig',
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'mason-org/mason.nvim' },
    opts = {
      ensure_installed = {
        -- LSP
        'lua_ls',
        'clangd',
        'cssls',
        'tinymist',
        'basedpyright',
        'marksman',
        'neocmake',
        'tailwindcss',
        'vtsls',
        'ruff',
        'svelte',
        'jdtls',
        -- Linters/formatters
        'stylua',
        'prettier',
        'clang-format',
        'cmakelang',
        'java-debug-adapter',
        'java-test',
        'vale',
      },
    },
  },
}
