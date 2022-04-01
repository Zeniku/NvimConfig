local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local lsp_diagnostics = {
	"lsp_diagnostics", -- custom component evil line lsp client + lualine diagnostics
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = true
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
	shorting_target = 30,
	symbols = {
		modified = ' ',
		readonly = ' ',
		unnamed = '[NoName]',
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
		lualine_b = { lsp_diagnostics },
		lualine_c = { filename },
		-- lualine_x = { diff, "encoding"},
	  lualine_x = { diff },
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
