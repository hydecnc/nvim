local opt = vim.opt_local

opt.wrap = true

require('mini.pairs').setup {
  mappings = { ['$'] = { action = 'closeopen', pair = '$$', neigh_pattern = '[^\\].', register = { cr = false } } },
}
