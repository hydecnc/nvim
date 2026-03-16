local opt = vim.opt_local

opt.wrap = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

require('mini.pairs').setup {
  mappings = { ['$'] = { action = 'closeopen', pair = '$$', neigh_pattern = '[^\\].', register = { cr = false } } },
}
