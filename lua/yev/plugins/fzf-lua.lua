return {
	"ibhagwan/fzf-lua",

	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			winopts = {
				height = 0.85,
				width = 0.80,
				preview = {
					border = "noborder",
					wrap = "nowrap",
					hidden = "nohidden",
					vertical = "down:45%",
					horizontal = "right:60%",
					layout = "flex",
					flip_columns = 120,
				},
				borderchars = { "", "", "", "", "", "", "", "" }, -- Match telescope style
			},
			keymap = {
				builtin = {
					["<c-d>"] = "preview-page-down",
					["<c-u>"] = "preview-page-up",
				},
			},
		})

		-- Use a different leader key to avoid conflicts with telescope
		vim.keymap.set("n", "<leader>z", "", { desc = "+ FZF Find" })
		vim.keymap.set("n", "<leader>zf", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
		vim.keymap.set("n", "<leader>zc", "<cmd>FzfLua live_grep<cr>", { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>zb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
		vim.keymap.set("n", "<leader>zh", "<cmd>FzfLua help_tags<cr>", { desc = "Help Tags" })
		vim.keymap.set("n", "<leader>zc", "<cmd>FzfLua commands<cr>", { desc = "Commands" })
		vim.keymap.set("n", "<leader>zr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent Files" })
		vim.keymap.set("n", "<leader>zk", "<cmd>FzfLua keymaps<cr>", { desc = "Keymaps" })
		vim.keymap.set("n", "<leader>zt", "<cmd>FzfLua tags<cr>", { desc = "Tags" })
		vim.keymap.set("n", "<leader>zw", function()
			local word = vim.fn.expand("<cword>") -- Get the word under the cursor
			fzf.grep({ search = word })
		end, { desc = "Find word under cursor" })
		vim.keymap.set("n", "<leader>zm", "<cmd>FzfLua git_status<cr>", { desc = "Git Modified Files" })
	end,
}
