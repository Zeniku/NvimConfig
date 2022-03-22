local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
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
	"Ifilename", -- custom component 
	colored = true,
	file_status = true,      -- Displays file status (readonly status, modified status)
	path = 0,
	shorting_target = 40, 
	symbols = {
		modified = ' ',      -- Text to show when the file is modified.
		readonly = ' ',      -- Text to show when the file is non-modifiable or readonly.
		unnamed = '[UnNamed]', -- Text to show for unnamed buffers.
	},
}

-- combime filename and filetype which is bad code 
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
		lualine_b = { diagnostics },
		lualine_c = { filename },
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
