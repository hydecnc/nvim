return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
              -- bg = '#000000',
              float = {
                bg = 'none',
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      require('kanagawa').setup(opts)
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
