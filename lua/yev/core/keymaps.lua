vim.g.mapleader = " "

-- Insert UUID
vim.keymap.set("i", "<c-u>", "<c-r>=trim(system('uuidgen | tr A-Z a-z'))<cr>", { desc = "Insert UUID at cursor" })

-- Function to insert console.log(''); with cursor inside quotes
local function insert_console_log()
	local log_statement = "console.log('');"
	vim.api.nvim_put({ log_statement }, "l", false, false) -- Insert on the line below
	vim.cmd("normal! $2h i") -- Move to end of line, go back 2 characters, enter insert mode
end

-- Keymaps for Insert and Normal Modes
-- vim.keymap.set("i", "<leader>cl", function()
-- 	insert_console_log()
-- end, { noremap = true, silent = true, desc = "Insert console.log() in insert mode" })

vim.keymap.set("n", "<leader>cl", function()
	insert_console_log()
end, { noremap = true, silent = true, desc = "Insert console.log() in normal mode" })

-- Copy current file path
vim.api.nvim_set_keymap(
	"n",
	"<leader>cp",
	[[:lua vim.fn.setreg('+', vim.fn.expand('%:p'))<CR>]],
	{ noremap = true, silent = true, desc = "Copy current file path" }
)

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>rr",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "Find and replace word under cursor" }
)

vim.keymap.set("n", "<leader>y", '"*yy', { desc = "Yank line to system clipboard" })

vim.keymap.set("v", "<leader>y", '"*y', { desc = "Yank selection to system clipboard" })

-- Search
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Splits
vim.keymap.set("n", "<leader>s", "", { desc = "+ Split" })
vim.keymap.set("n", "<leader>sv", "<c-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<c-w>s", { desc = "Split window horizontally" })

-- Move lines
vim.keymap.set("n", "<a-down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<a-up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<a-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<a-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<a-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<a-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Multi line scrolling
vim.keymap.set("n", "<s-up>", "2k", { desc = "" })
vim.keymap.set("n", "<s-down>", "2j", { desc = "" })
vim.keymap.set("n", "<s-c-up>", "10k", { desc = "" })
vim.keymap.set("n", "<s-c-down>", "10j", { desc = "" })
vim.keymap.set("n", "<s-j>", "30jzz", { desc = "" })
vim.keymap.set("n", "<s-k>", "30kzz", { desc = "" })
vim.keymap.set("n", "<s-h>", "30h", { desc = "" })
vim.keymap.set("n", "<s-l>", "30l", { desc = "" })

-- Save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- vim.keymap.set("n", "j", "jzz", { noremap = true, silent = true })
-- vim.keymap.set("n", "k", "kzz", { noremap = true, silent = true })
