local status, colorizer = pcall(require, "colorizer")
if not status then
	return
end

-- colorizer.setup({
-- 	"css",
-- 	"javascript",
-- 	html = { names = false },
-- 	css = {
-- 		RGB = true, -- #RGB hex codes
-- 		RRGGBB = true, -- #RRGGBB hex codes
-- 		names = true, -- "Name" codes like Blue
-- 		RRGGBBAA = true, -- #RRGGBBAA hex codes
-- 		rgb_fn = true, -- CSS rgb() and rgba() functions
-- 		hsl_fn = true, -- CSS hsl() and hsla() functions
-- 		css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
-- 		css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
-- 		-- Available modes: foreground, background
-- 		mode = "background", -- Set the display mode.
-- 	},
-- })

colorizer.setup({
	filetypes = { "css", "javascript", "!vim", "!lua", "!html" },
	user_default_options = {
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = true, -- "Name" codes like Blue or blue
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		AARRGGBB = true, -- 0xAARRGGBB hex codes
		rgb_fn = true, -- CSS rgb() and rgba() functions
		hsl_fn = true, -- CSS hsl() and hsla() functions
		css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		-- Available modes for `mode`: foreground, background,  virtualtext
		mode = "virtualtext", -- Set the display mode. -- foreground, background, virtualtext
		-- Available methods are false / true / "normal" / "lsp" / "both"
		-- True is same as normal
		tailwind = false, -- Enable tailwind colors
		-- parsers can contain values used in |user_default_options|
		sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
		virtualtext = "■",
	},
	-- all the sub-options of filetypes apply to buftypes
	buftypes = {},
})
