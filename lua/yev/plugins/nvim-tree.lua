return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            git = true,
          },
          glyphs = {
            folder = {
              arrow_closed = "→",
              arrow_open = "↓",
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      update_focused_file = {
        enable = true,
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        enable = true,
      },
    })

    vim.keymap.set("n", "<leader>e", "", { desc = "+ File explorer" })
    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

    vim.keymap.set("n", "<C-l>", "<C-w><Right>", { desc = "Focus editor" })
    vim.keymap.set("n", "<C-h>", "<C-w><Left>", { desc = "Focus tree" })
    vim.keymap.set("n", "<C-j>", "<C-w><Down>", { desc = "Focus editor" })
    vim.keymap.set("n", "<C-k>", "<C-w><Up>", { desc = "Focus tree" })
  end,
}
