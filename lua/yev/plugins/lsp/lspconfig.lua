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
        -- Code actions with import all option
        vim.keymap.set("n", "<leader>ca", function()
          vim.lsp.buf.code_action({
           context = {
              only = {
                "source.addMissingImports",
                "source.removeUnused",
                "source.fixAll",
                "quickfix",
                "refactor",
              },
            },
          })
        end, opts)
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

