-- Quicker window movement
-- vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {})
-- vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {})
-- vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {})
-- vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {})
vim.api.nvim_set_keymap("n", "gn", ":bnext<CR>", {})
vim.api.nvim_set_keymap("n", "gb", ":bprevious<CR>", {})
vim.api.nvim_set_keymap("n", "tc", ":tabnew<CR>", {})
vim.api.nvim_set_keymap("n", "td", ":tabclose<CR>", {})
vim.api.nvim_set_keymap("n", "tn", ":tabnext<CR>", {})
vim.api.nvim_set_keymap("n", "tp", ":tabprevious<CR>", {})

-- Resize windows
vim.api.nvim_set_keymap("n", "<Up>", ":resize +2 <CR>", {})
vim.api.nvim_set_keymap("n", "<Down>", ":resize -2 <CR>", {})
vim.api.nvim_set_keymap("n", "<Left>", ":vertical resize +2 <CR>", {})
vim.api.nvim_set_keymap("n", "<Right>", ":vertical resize -2 <CR>", {})

-- Tabs
vim.api.nvim_set_keymap("n", "<Leader>1", "1gt", {})
vim.api.nvim_set_keymap("n", "<Leader>2", "2gt", {})
vim.api.nvim_set_keymap("n", "<Leader>3", "3gt", {})
vim.api.nvim_set_keymap("n", "<Leader>4", "4gt", {})
vim.api.nvim_set_keymap("n", "<Leader>5", "5gt", {})
vim.api.nvim_set_keymap("n", "<Leader>6", "6gt", {})
vim.api.nvim_set_keymap("n", "<Leader>7", "7gt", {})


-- Jump to previous file
vim.api.nvim_set_keymap("n", "<TAB><TAB>", "<c-^>", {})

-- Hop
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>HopWord<CR>", {})
vim.api.nvim_set_keymap("v", "<C-j>", "<cmd>HopWord<CR>", {})
vim.api.nvim_set_keymap("n", "<C-/>", "<cmd>HopPattern<CR>", {})
vim.api.nvim_set_keymap("v", "<C-/>", "<cmd>HopPattern<CR>", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>HopLine<CR>", {})
vim.api.nvim_set_keymap("v", "<C-l>", "<cmd>HopLine<CR>", {})

-- Toggle NvimTree
vim.api.nvim_set_keymap("n", "<C-n>", ':NvimTreeFindFileToggle<CR>', {})

-- Emmet
vim.api.nvim_set_keymap("n", "<Leader>,", '<C-y>,', {})

-- Floaterm
vim.api.nvim_set_keymap("n", "<C-t>", ":FloatermToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("t", "<C-t>", "<C-\\><C-n>:FloatermToggle<CR>", { silent = true })
