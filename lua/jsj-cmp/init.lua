local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'cmp_tabnine' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5, },
    { name = 'dictionary', keyword_length = 2, },
  },
  formatting = {
    -- fields = { 'kind', 'abbr', 'menu' },
    fields = { 'abbr', 'kind', 'menu' },
    format = function(entry, vim_item)
      vim_item.kind = require('jsj-cmp.lsp_symbols')[vim_item.kind] and require('jsj-cmp.lsp_symbols')[vim_item.kind] or vim_item.kind
      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
        cmp_tabnine = "[TN]",
        dictionary = "[Dict]",
      })[entry.source.name]
      return vim_item
    end,
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
    cusom_menu = true,
  },
}

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
})

require("cmp_dictionary").setup{
    dic = {
        ["*"] = "/usr/share/dict/words",
        -- ["markdown"] = { "path/to/mddict", "path/to/mddict2" },
        -- ["javascript,typescript"] = { "path/to/jsdict" },
    },
    -- The following are default values, so you don't need to write them if you don't want to change them
    exact = 2,
    async = false,
    capacity = 5,
    debug = false,
}
