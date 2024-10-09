return {
	"folke/trouble.nvim",
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>x", "", desc = "+ Show diagnostics" },
		{ "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", desc = "Show diagnostics" },
	},
}
