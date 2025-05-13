return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP completion source
    "onsails/lspkind.nvim", -- Icons for LSP
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspkind = require("lspkind")

    -- Set up LSP diagnostics with simple icons and settings
    vim.diagnostic.config({
      virtual_text = {
        -- Only show errors inline, not warnings or info
        severity = { min = vim.diagnostic.severity.ERROR },
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        -- Show all diagnostic information in the floating window
        source = "always",
        border = "rounded",
      },
    })

    -- Set up keymaps for LSP actions
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- LSP key bindings
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        
        -- Show documentation for what is under cursor
        vim.keymap.set("n", "<S-i>", vim.lsp.buf.hover, opts)

        -- Go to Definition on Enter
        vim.keymap.set("n", "<CR>", vim.lsp.buf.definition, opts)
        
        -- Restart LSP
        vim.keymap.set("n", "<leader>rs", vim.cmd.LspRestart, opts)
        
        -- Source organization commands (import all, remove unused)
        vim.keymap.set("n", "<leader>oi", function()
          vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
          })
        end, { buffer = ev.buf, desc = "Organize Imports" })
      end,
    })

    -- Set up LSP capabilities (using nvim-cmp for autocompletion)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- LSP servers configuration
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- Add any additional settings for ts_ls here if needed
      end,
    })

    lspconfig.html.setup({
      capabilities = capabilities,
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

  end,
}

-- return {
-- 	"neovim/nvim-lspconfig",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	dependencies = {
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		{ "antosha417/nvim-lsp-file-operations", config = true },
-- 	},
-- 	config = function()
-- 		local lspconfig = require("lspconfig")
-- 		local mason_lspconfig = require("mason-lspconfig")
-- 		local cmp_nvim_lsp = require("cmp_nvim_lsp")
--
-- 		vim.diagnostic.config({
-- 			virtual_text = {
-- 				-- Show inline errors and warnings
-- 				source = "if_many", -- Show source if there are multiple diagnostics
-- 				prefix = "●", -- This can be any symbol you like
-- 				spacing = 4, -- Adjust spacing
-- 				severity = { min = vim.diagnostic.severity.ERROR },
-- 			},
-- 			float = {
-- 				source = "always", -- Always show the source of the diagnostic in the floating window
-- 			},
-- 			signs = true,
-- 			underline = true,
-- 			update_in_insert = false, -- Do not show diagnostics while typing
-- 			severity_sort = true,
-- 		})
--
-- 		vim.api.nvim_create_autocmd("LspAttach", {
-- 			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 			callback = function(ev)
-- 				local opts = { buffer = ev.buf, silent = true }
--
-- 				opts.desc = "Show LSP references"
-- 				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
--
-- 				opts.desc = "Go to declaration"
-- 				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
--
-- 				-- opts.desc = "Show LSP definitions"
-- 				-- vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
-- 				--
-- 				-- opts.desc = "Go to definition with Enter"
-- 				-- vim.keymap.set("n", "<CR>", vim.lsp.buf.definition, opts)
--
-- 				opts.desc = "Show LSP implementations"
-- 				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
--
-- 				opts.desc = "Show LSP type definitions"
-- 				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
--
-- 				opts.desc = "See available code actions"
-- 				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
--
-- 				opts.desc = "Smart rename"
-- 				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--
-- 				opts.desc = "Show buffer diagnostics"
-- 				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
--
-- 				opts.desc = "Show line diagnostics"
-- 				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
--
-- 				opts.desc = "Go to previous diagnostic"
-- 				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
--
-- 				opts.desc = "Go to next diagnostic"
-- 				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
--
-- 				opts.desc = "Show documentation for what is under cursor"
-- 				vim.keymap.set("n", "<S-i>", vim.lsp.buf.hover, opts)
--
-- 				opts.desc = "Restart LSP"
-- 				vim.keymap.set("n", "<leader>rs", vim.cmd.LspRestart, opts)
-- 			end,
-- 		})
--
-- 		local capabilities = cmp_nvim_lsp.default_capabilities()
-- 		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
--
-- 		for type, icon in pairs(signs) do
-- 			local hl = "DiagnosticSign" .. type
-- 			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- 		end
--
-- 		mason_lspconfig.setup_handlers({
-- 			function(server_name)
-- 				lspconfig[server_name].setup({
-- 					capabilities = capabilities,
-- 				})
-- 			end,
-- 			["ltex"] = function()
-- 				lspconfig.ltex.setup({
-- 					capabilities = capabilities,
-- 					settings = {
-- 						ltex = {
-- 							language = "en-US",
-- 							additionalRules = {
-- 								enablePickyRules = true,
-- 								motherTongue = "en",
-- 							},
-- 						},
-- 					},
-- 				})
-- 			end,
-- 		})
-- 		-- mason_lspconfig.setup_handlers({
-- 		-- 	function(server_name)
-- 		-- 		lspconfig[server_name].setup({
-- 		-- 			capabilities = capabilities,
-- 		-- 		})
-- 		-- 	end,
-- 		-- })
-- 	end,
-- }
