vim.cmd.syntax([[region markdownLinkText matchgroup=markdownLinkTextDelimiter]] ..
  [[ start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@="]] ..
  [[ nextgroup=markdownLink,markdownId skipwhite]] ..
  [[ contains=@markdownInline,markdownLineStart concealends]])

vim.cmd.syntax([[region markdownLink matchgroup=markdownLinkDelimiter]] ..
  [[ start="(" end=")" contains=markdownUrl keepend contained conceal]])
