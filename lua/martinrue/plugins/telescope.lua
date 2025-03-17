return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local gitsigns = require("gitsigns")

		-- Custom function to show modified files with gitsigns
		local function git_modified_files()
			local modified_files = gitsigns.get_hunks() -- Fetch hunks (changes) tracked by Git
			local file_list = {}

			-- Collect modified file paths
			for file, _ in pairs(modified_files) do
				table.insert(file_list, file)
			end

			-- Use Telescope to display the modified files
			require("telescope.pickers")
				.new({}, {
					prompt_title = "Git Modified Files",
					finder = require("telescope.finders").new_table({
						results = file_list,
					}),
					sorter = require("telescope.config").values.generic_sorter({}),
					previewer = require("telescope.previewers").vim_buffer_cat.new({}),
				})
				:find()
		end

		telescope.setup({
			defaults = {
				borderchars = { "", "", "", "", "", "", "", "" },
				path_display = { "smart" },
				mappings = {
					i = {
						["C-q"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["<C-d>"] = actions.delete_buffer,
					},
				},
			},
			pickers = {
				git_status = {
					-- Optional mappings
					mappings = {
						i = {
							["<C-o>"] = require("telescope.actions").select_default,
							["<C-v>"] = require("telescope.actions").select_vertical,
						},
						n = {
							["<C-o>"] = require("telescope.actions").select_default,
							["<C-v>"] = require("telescope.actions").select_vertical,
						},
					},
				},
			},
			extensions = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "png", "webp", "jpg", "jpeg" },
					-- find command (defaults to `fd`)
					find_cmd = "rg",
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("media_files")
		-- "foo bar" baz	search for „foo bar“ in dir „baz“
		-- --no-ignore "foo bar	search for „foo bar“ ignoring ignores
		-- "foo" --iglob **/test/**	search for „foo“ in any „test“ path

		vim.keymap.set("n", "<leader>f", "", { desc = "+ Fuzzy find" })
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
		vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fw", function()
			local word = vim.fn.expand("<cword>") -- Get the word under the cursor
			require("telescope.builtin").grep_string({
				search = "", -- Leave search empty to allow editing
				default_text = word, -- Pass the word under the cursor as the default input
			})
		end, { noremap = true, silent = true, desc = "Find and edit word under cursor" })
		vim.keymap.set(
			"n",
			"<leader>fg",
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "Fuzzy find with args" }
		)
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>gm",
		-- 	git_modified_files,
		-- 	{ noremap = true, silent = true, desc = "Show Git modified files" }
		-- )
	end,
}
