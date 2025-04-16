return {
	"folke/snacks.nvim",
	opts = {
		image = { enabled = true },
		indent = { enabled = true },
		scroll = { enabled = true },
		-- explorer = {},
		picker = {
			sources = {
				explorer = {},
			},
		},
	},
	keys = {
		-- Top Pickers & Explorer
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		-- Grep
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- search
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>uC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		-- LSP
		-- {
		-- 	"gd",
		-- 	function()
		-- 		Snacks.picker.lsp_definitions()
		-- 	end,
		-- 	desc = "Goto Definition",
		-- },
		-- {
		-- 	"gD",
		-- 	function()
		-- 		Snacks.picker.lsp_declarations()
		-- 	end,
		-- 	desc = "Goto Declaration",
		-- },
		-- {
		-- 	"gr",
		-- 	function()
		-- 		Snacks.picker.lsp_references()
		-- 	end,
		-- 	nowait = true,
		-- 	desc = "References",
		-- },
		-- {
		-- 	"gI",
		-- 	function()
		-- 		Snacks.picker.lsp_implementations()
		-- 	end,
		-- 	desc = "Goto Implementation",
		-- },
		-- {
		-- 	"gy",
		-- 	function()
		-- 		Snacks.picker.lsp_type_definitions()
		-- 	end,
		-- 	desc = "Goto T[y]pe Definition",
		-- },
		-- {
		-- 	"<leader>ss",
		-- 	function()
		-- 		Snacks.picker.lsp_symbols()
		-- 	end,
		-- 	desc = "LSP Symbols",
		-- },
		-- {
		-- 	"<leader>sS",
		-- 	function()
		-- 		Snacks.picker.lsp_workspace_symbols()
		-- 	end,
		-- 	desc = "LSP Workspace Symbols",
		-- },
	},
}
