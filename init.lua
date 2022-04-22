vim.cmd [[
  augroup init
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
  augroup end
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
  "colorscheme",
  "bufferline",
  "luaLine",
  "colorizer",
  "autocommands",
}

for _, v in pairs(usr) do
  require("usr." .. v)
end
