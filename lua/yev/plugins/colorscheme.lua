return {
	"nickkadutskyi/jb.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		-- require("jb").setup({transparent = true})
		vim.cmd("colorscheme jb")
	end,
}

-- return {
-- 	"AlexvZyl/nordic.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		local palette = require("nordic.colors")
--
-- 		require("nordic").setup({
-- 			-- This callback can be used to override the colors used in the base palette.
-- 			on_palette = function(palette) end,
-- 			-- This callback can be used to override the colors used in the extended palette.
-- 			after_palette = function(palette) end,
-- 			-- This callback can be used to override highlights before they are applied.
-- 			on_highlight = function(highlights, palette) end,
-- 			-- Enable bold keywords.
-- 			bold_keywords = false,
-- 			-- Enable italic comments.
-- 			italic_comments = true,
-- 			-- Enable editor background transparency.
-- 			transparent = {
-- 				-- Enable transparent background.
-- 				bg = false,
-- 				-- Enable transparent background for floating windows.
-- 				float = true,
-- 			},
-- 			-- Enable brighter float border.
-- 			bright_border = false,
-- 			-- Reduce the overall amount of blue in the theme (diverges from base Nord).
-- 			reduced_blue = true,
-- 			-- Swap the dark background with the normal one.
-- 			swap_backgrounds = false,
-- 			-- Cursorline options.  Also includes visual/selection.
-- 			cursorline = {
-- 				-- Bold font in cursorline.
-- 				bold = false,
-- 				-- Bold cursorline number.
-- 				bold_number = true,
-- 				-- Available styles: 'dark', 'light'.
-- 				theme = "dark",
-- 				-- Blending the cursorline bg with the buffer bg.
-- 				blend = 1,
-- 			},
-- 			noice = {
-- 				-- Available styles: `classic`, `flat`.
-- 				style = "classic",
-- 			},
-- 			telescope = {
-- 				-- Available styles: `classic`, `flat`.
-- 				style = "flat",
-- 			},
-- 			leap = {
-- 				-- Dims the backdrop when using leap.
-- 				dim_backdrop = false,
-- 			},
-- 			ts_context = {
-- 				-- Enables dark background for treesitter-context window
-- 				dark_background = true,
-- 			},
-- 		})
--
-- 		vim.cmd("colorscheme nordic")
-- 		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1e2022" })
-- 	end,
-- }

