local cmp = require('cmp')
cmp.setup {
  -- TODO: snippet
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
    { name = 'buffer'},
    { name = 'path' },
    { name = 'nvim_lsp' },
    -- { name = 'nvim_lua' }
    -- { name = 'latex_symbols' }
    { name = 'spell' },
    { name = 'luasnip' },
    -- { name = 'tags' },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = require('jsj-comp.lsp_symbols')[vim_item.kind] and require('jsj-comp.lsp_symbols')[vim_item.kind] or vim_item.kind
      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
        spell = "[Spell]",
        path = "[Path]",
        orgmode = "[Orgmode]"
      })[entry.source.name]
      return vim_item
    end,
  },
}

vim.api.nvim_exec([[
  autocmd FileType tex lua require'cmp'.setup.buffer{sources = {{ name = 'latex_symbols' },}}
  autocmd FileType lua lua require'cmp'.setup.buffer{sources = {{ name = 'nvim_lua' },}}
  autocmd FileType org lua require'cmp'.setup.buffer{sources = {{ name = 'orgmode' },}}
]], false)
