local status_ok, _ = pcall(require, "lualine")
if not status_ok then
	return
end
local M = require('lualine.components.diagnostics'):extend()

-- From evil line example i think
local default_options = {
  icon = ' LSP:'
}

function M:init(options)
	M.super.init(self, options)
  self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
end

function M:update_status()
  -- stolen ._.
  local msg = 'Idle'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    msg = 'Idle'
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      msg = client.name
    end
  end

	return msg .. " " .. M.super.update_status(self) -- color is not accounted
end

return M
