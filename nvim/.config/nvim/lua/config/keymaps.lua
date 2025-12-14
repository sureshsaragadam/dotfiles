-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "\\", "<cmd>Oil<CR>", { desc = "Open parent directory (Oil)" })

----------------------------------------------------------------------
-- Window navigation with Ctrl + hjkl
----------------------------------------------------------------------
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })

----------------------------------------------------------------------
-- Window navigation with Ctrl + Arrow keys
----------------------------------------------------------------------
vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>yy", 'ggVG"+y', { silent = true, desc = "Copy entire file" })
