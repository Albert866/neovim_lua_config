local is_ok, lualine = pcall(require, "lualine")
if not is_ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "material",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	-- Lualine has sections as shown below.
	-- +-------------------------------------------------+
	-- | A | B | C                             X | Y | Z |
	-- +-------------------------------------------------+
	-- Each section holds its components
	sections = {
		lualine_a = { "mode" },
        lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {
			{
				"filename",
				file_status = true, -- Displays file status (read-only status, modified status)
				-- Path configurations
				-- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory
				-- 4: Filename and parent dir, with tilde as the home directory
				path = 3,
				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
			},
		},
        lualine_x = { "encoding", "filesize", "filetype" },
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
    tabline = {
        lualine_a = { 'buffers' },
        lualine_b = { 'fileformat' },
        lualine_c = { 'filetype' },
        lualine_x = { 'progress' },
        lualine_y = { 'location' },
        lualine_z = { 'tabs' }
    },
    winbar = {},
    inactive_winbar = {},
	extensions = {},
})
