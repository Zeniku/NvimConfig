vim.cmd [[
  augroup init
    autocmd!
    autocmd BufWritePost init.lua source $MYVIMRC
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
  "nvimtree",
  "onedark",
  "bufferline",
  "luaLine",
  "colorizer",
  "treesitter"
}

for i, v in pairs(usr) do
  require("usr." .. v)
end
