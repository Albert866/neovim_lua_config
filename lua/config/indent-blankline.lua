-- lukas-reineke/indent-blankline.nvim configure

local is_ok, indent_blankline = pcall(require, "ibl")
if not is_ok then
    print("The ibl not find!!!")
	return
end

-- For all available options, take a look at `:help ibl.config.`
indent_blankline.setup()
