local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end

-- Lua
onedark.setup {
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
    strings = 'none',
    variables = 'bold'
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {
    PreProc = { fg = '$blue' }, --polygot luaFunctionCall uses PreProc
    Statement = { fg = '$red' },
    Conditional = { fg = "$red" },
    Repeat = { fg = "$red" },
    Exeption = { fg = "$red" },
  }, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true,   -- use undercurl instead of underline for diagnostics
    background = true,    -- use background color for virtual text
  },
}

onedark.load()
