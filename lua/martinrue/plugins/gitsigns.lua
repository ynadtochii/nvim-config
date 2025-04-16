return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>h", "", { desc = "+ Hunk" })
    vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset current hunk" })
    vim.keymap.set("v", "<leader>hs", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Stage selected hunks" })
    vim.keymap.set("v", "<leader>hr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Reset selected hunks" })
    vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage entire buffer" })
    vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo last stage hunk" })
    vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset entire buffer" })
    vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview current hunk" })
    vim.keymap.set("n", "<leader>hb", function()
      gitsigns.blame_line({ full = true })
    end, { desc = "Show blame for current line" })
    vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle blame for current line" })
    vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "Show diff for current file" })
    vim.keymap.set("n", "<leader>hD", function()
      gitsigns.diffthis("~")
    end, { desc = "Show diff against previous revision" })
    vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle deleted lines visibility" })
  end,
}
