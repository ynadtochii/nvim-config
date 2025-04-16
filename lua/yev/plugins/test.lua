return {
	-- Neotest core plugin
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/nvim-nio",
			"marilari88/neotest-vitest",
			"haydenmeade/neotest-jest",
		},
		config = function()
			local neotest = require("neotest")

			-- Setup neotest with Vitest and Jest adapters
			neotest.setup({
				adapters = {
					require("neotest-vitest"),
					require("neotest-jest")({
						jestCommand = "npm test --",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
				quickfix = {
					open = false,
				},
				output = {
					enabled = true,
					open_on_run = "short",
				},
			})
		end,
		keys = {
			{ "<leader>t", "", desc = "+ Test" },
			{
				"<leader>tt",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run File",
			},
			{
				"<leader>tT",
				function()
					require("neotest").run.run(vim.uv.cwd())
				end,
				desc = "Run All Test Files",
			},
			{
				"<leader>tr",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Nearest",
			},
			{
				"<leader>tl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Run Last",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle Summary",
			},
			{
				"<leader>to",
				function()
					require("neotest").output.open({ enter = true, auto_close = true })
				end,
				desc = "Show Output",
			},
			{
				"<leader>tO",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Toggle Output Panel",
			},
			{
				"<leader>tS",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop",
			},
			{
				"<leader>tw",
				function()
					require("neotest").watch.toggle(vim.fn.expand("%"))
				end,
				desc = "Toggle Watch",
			},
		},
	},
}

-- 	vim.keymap.set("n", "<leader>tt", function()
-- 		neotest.run.run() -- Run the nearest test
-- 	end, { desc = "Run nearest test" })
--
-- 	vim.keymap.set("n", "<leader>tf", function()
-- 		neotest.run.run(vim.fn.expand("%")) -- Run the entire file
-- 	end, { desc = "Run file tests" })
--
-- 	vim.keymap.set("n", "<leader>to", function()
-- 		neotest.output.open({ enter = true }) -- Open the test output
-- 	end, { desc = "Open test output" })
--
-- 	vim.keymap.set("n", "<leader>ts", function()
-- 		neotest.summary.toggle() -- Toggle the test summary
-- 	end, { desc = "Toggle test summary" })
--
-- 	vim.keymap.set("n", "<leader>td", function()
-- 		neotest.run.run({ strategy = "dap" }) -- Debug the nearest test
-- 	end, { desc = "Debug nearest test" })
-- end,

-- return {
-- 	"nvim-neotest/neotest",
-- 	dependencies = {
-- 		"nvim-neotest/nvim-nio",
-- 		"nvim-lua/plenary.nvim",
-- 		"antoinemadec/FixCursorHold.nvim",
-- 		"nvim-treesitter/nvim-treesitter",
-- 	},
-- 	keys = {
-- 		{ "<leader>t", "", desc = "+test" },
-- 		{
-- 			"<leader>tt",
-- 			function()
-- 				require("neotest").run.run(vim.fn.expand("%"))
-- 			end,
-- 			desc = "Run File",
-- 		},
-- 		{
-- 			"<leader>tT",
-- 			function()
-- 				require("neotest").run.run(vim.uv.cwd())
-- 			end,
-- 			desc = "Run All Test Files",
-- 		},
-- 		{
-- 			"<leader>tr",
-- 			function()
-- 				require("neotest").run.run()
-- 			end,
-- 			desc = "Run Nearest",
-- 		},
-- 		{
-- 			"<leader>tl",
-- 			function()
-- 				require("neotest").run.run_last()
-- 			end,
-- 			desc = "Run Last",
-- 		},
-- 		{
-- 			"<leader>ts",
-- 			function()
-- 				require("neotest").summary.toggle()
-- 			end,
-- 			desc = "Toggle Summary",
-- 		},
-- 		{
-- 			"<leader>to",
-- 			function()
-- 				require("neotest").output.open({ enter = true, auto_close = true })
-- 			end,
-- 			desc = "Show Output",
-- 		},
-- 		{
-- 			"<leader>tO",
-- 			function()
-- 				require("neotest").output_panel.toggle()
-- 			end,
-- 			desc = "Toggle Output Panel",
-- 		},
-- 		{
-- 			"<leader>tS",
-- 			function()
-- 				require("neotest").run.stop()
-- 			end,
-- 			desc = "Stop",
-- 		},
-- 		{
-- 			"<leader>tw",
-- 			function()
-- 				require("neotest").watch.toggle(vim.fn.expand("%"))
-- 			end,
-- 			desc = "Toggle Watch",
-- 		},
-- 	},
-- }
