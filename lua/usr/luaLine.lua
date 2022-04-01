local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local nolsp = function()
  local clients = vim.lsp.get_active_clients()
	return not (next(clients) == nil)
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
	cond = nolsp
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = "● ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local filename = {
	"Ifilename", -- custom component combime filename and filetype which is bad code 
	colored = true,
	file_status = true,
	path = 0,
	shorting_target = 40,
	symbols = {
		modified = ' ',
		readonly = ' ',
		unnamed = '[UnNamed]',
	},
}

-- cool function for progress 
-- stolen :c 

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local location = {
	"location",
	fmt = function(str)
		return str .. " " .. progress()
	end
}

local lspcl = {
	function()
    local msg = 'Not Active'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#dfdfdf', gui = 'bold' },
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { diagnostics },
		lualine_c = { filename , lspcl },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
	  lualine_x = { diff, "encoding" },
		lualine_y = { location },
		lualine_z = { branch },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
