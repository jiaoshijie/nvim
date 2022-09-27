require('mini.align').setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    start = 'ga',
    start_with_preview = 'gA',
  },

  -- Modifiers changing alignment steps and/or options
  modifiers = {
    ['|'] = function(_, opts)
      opts.split_pattern = '|'
      opts.justify_side = 'center'
      opts.merge_delimiter = ' '
    end,
  },

  -- Default options controlling alignment process
  options = {
    split_pattern = '',
    justify_side = 'left',
    merge_delimiter = '',
  },
})
