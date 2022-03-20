local M = require('lualine.components.filename'):extend()

function M:init(options)
  M.super.init(self, options)
  self.icon_hl_cache = {}
end

M.apply_icon = require('lualine.components.filetype').apply_icon

return M
