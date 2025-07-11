return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false, -- set this if you want to always pull the latest change
	opts = {
		providers = {
			tavily = {
				api_key = os.getenv("TAVILY_API_KEY"),
				search_depth = "advanced", -- basic or advanced
				include_domains = {},  -- optional: list of domains to include
				exclude_domains = {},  -- optional: list of domains to exclude
				max_results = 5,      -- number of results to return
			},
			claude = {
				endpoint = "https://api.anthropic.com",
				-- model = "claude-3-7-sonnet-20250219",
				model = "claude-3-5-sonnet-20241022",
				extra_request_body = {
					temperature = 0,
					max_tokens = 4096,
				},
			},
		},
		behaviour = {
			auto_suggestions = false,
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = true,
		},
		mappings = {
			suggestion = {
				accept = "<Tab>",
			},
		},
		hints = { enabled = true },
		windows = {
			position = "right",
			wrap = true,
			width = 30,
			sidebar_header = {
				align = "center",
				rounded = true,
			},
		},
		highlights = {
			diff = {
				current = "DiffText",
				incoming = "DiffAdd",
			},
		},
	},

	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
