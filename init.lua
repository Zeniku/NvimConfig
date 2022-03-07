
vim.cmd [[
  augroup init
    autocmd!
    autocmd BufWritePost init.lua source $MYVIMRC
  augroup end
]]

vim.cmd [[
  autocmd BufWritePost * ':silent! !git add %'
]]

require("usr.options")
require("usr.keymaps")
require("usr.plugins")
require("usr.lsp")
require("usr.Cmp")
require("usr.colorscheme")
require("usr.bufferline")
require("usr.luaLine")
