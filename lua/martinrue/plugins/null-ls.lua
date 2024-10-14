-- lua/plugins/null-ls.lua
return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Prettier for formatting
				null_ls.builtins.formatting.prettier.with({
					extra_filetypes = { "svelte", "astro" }, -- Add extra file types if needed
					extra_args = { "--plugin", "prettier-plugin-tailwindcss" }, -- Include TailwindCSS plugin if necessary
				}),
				-- ESLint for linting and/or formatting
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.formatting.eslint,
			},
			-- Auto-format on save
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					neovim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					neovim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							neovim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
