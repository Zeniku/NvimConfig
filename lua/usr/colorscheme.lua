local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end

local conf = {
  -- Main options --
  style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false,  -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  -- toggle theme style ---
  toggle_style_key = '<leader>ts', -- Default keybinding to toggle
  -- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
  toggle_style_list = { 'deep', 'darker' },
  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'italic,bold',
    keywords = 'bold',
    functions = 'none',
    strings = 'bold',
    variables = 'bold'
  },

  -- Custom Highlights
  colors = {
    darkgreen = "#679B49"
  }, -- Override default colors
  highlights = {
    -- install uiiaoo/java-syntax.vim
    javaAccessKeyword = { fg = "$red", fmt = "bold"},
    javaInclude = { fg = "$red", fmt = "bold"},
    javaIdentifier = { fmt = "bold"},
    javaPackagePath = {fg = "$yellow"},
    javaPackageName = { fg = '$red'},
    -- Default 
    Conditional = { fg = "$red"},
    Statement = { fg = "$red"},
    Exeption = { fg = "$red"},
    Repeat = { fg = "$red"},
    PreProc = { fg = '$blue'},
    Structure = { fmt = 'bold'},
    String = { fg = '$darkgreen'}
  }, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true,   -- use undercurl instead of underline for diagnostics
    background = true,    -- use background color for virtual text
  },
}

vim.cmd [[
  syntax match javaPackageName "\v(^package\s+)@<=.*"
  syntax match javaimportName "\v(^import\s+)@<=.*"
  hi! link javaPackageName Include
  hi! link javaImportName javaPackagePath
]]

local colors = require("onedark.palette")[conf.style]
-- Lua
onedark.setup(conf)

vim.g.rainbow_active = true
vim.g.rainbow_conf = {
  --guifgs = {'firebrick', 'darkorange3', 'darkyellow', 'seagreen3', 'royalblue3'},
  guifgs = { colors.red, colors.orange, colors.yellow, colors.green, colors.blue },
  guis = {'bold'},
}

onedark.load()
