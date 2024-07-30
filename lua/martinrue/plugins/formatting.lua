return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				astro = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 2000,
			},
			formatters = {
				prettier = {
					args = function(self, ctx)
						if vim.endswith(ctx.filename, ".astro") then
							return {
								"--stdin-filepath",
								"$FILENAME",
								"--plugin",
								"prettier-plugin-astro",
								"--plugin",
								"prettier-plugin-tailwindcss",
							}
						end
						return { "--stdin-filepath", "$FILENAME", "--plugin", "prettier-plugin-tailwindcss" }
					end,
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
