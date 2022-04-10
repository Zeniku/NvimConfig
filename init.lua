vim.cmd [[
  augroup init
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
  augroup end
]]

vim.cmd [[
  autocmd BufWritePost * silent !git add %
]]

local usr = {
  "options",
  "keymaps",
  "plugins",
  "cmp",
  "lsp",
  "autopairs",
  "nvimtree",
  "telescope",
  "alpha",
  "onedark",
  "bufferline",
  "luaLine",
  "colorizer",
}

for _, v in pairs(usr) do
  require("usr." .. v)
end
