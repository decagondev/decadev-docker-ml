local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Directory navigation
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", opts)

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Terminal navigation
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- Custom
keymap.set("n", "<leader>w", ":w<CR>", opts)
keymap.set("n", "<leader>q", ":q<CR>", opts)
keymap.set("n", "<leader>h", ":nohlsearch<CR>", opts)
