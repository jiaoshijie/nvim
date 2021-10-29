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
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'cmp_tabnine' },
    { name = 'latex_symbols' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5, },
    { name = 'spell'},
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      vim_item.kind = require('jsj-cmp.lsp_symbols')[vim_item.kind] and require('jsj-cmp.lsp_symbols')[vim_item.kind] or vim_item.kind
      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
        spell = "[Spell]",
        path = "[Path]",
        luasnip = "[Snip]",
        cmp_tabnine = "[TN]",
      })[entry.source.name]
      return vim_item
    end,
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
