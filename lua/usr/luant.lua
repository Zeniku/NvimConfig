-- file for not lua

 -- run :RainbowToggleOn
vim.g.rainbow_active = false
vim.cmd [[
  let g:rainbow_conf = {
  \ 'guifgs': ['firebrick', 'darkyellow' ,'darkorange3', 'seagreen3', 'royalblue3'],
  \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
  \ 'guis': ['bold', 'bold', 'bold', 'bold', 'bold'],
  \}
]]

 -- Disable highlight most of stuff in java syntax
vim.cmd [[ hi link javaIdentifier None ]]
