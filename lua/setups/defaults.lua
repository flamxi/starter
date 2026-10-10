require('gitsigns').setup()
require('mini.comment').setup()
require('mini.starter').setup()

require('which-key').setup()
require('toggleterm').setup {
  open_mapping = [[<c-\>]], -- normal, insert and terminal mode
  direction = 'float',
  float_opts = { border = 'curved' },
}

