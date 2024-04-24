vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<ESC>", ":noh<CR>", { desc = "Clear highlights", silent = true })

keymap.set("n", ";", ":")

keymap.set("n", "<leader>rr", "<cmd>registers<CR>", { desc = "Show registers "})

-- Buffers
keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Show loaded buffers" })
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- Strip trailing space
keymap.set("n", "<leader>W", "<cmd>%s/\\s\\+$//<cr>:let @/=''<CR>", { desc = "Strip trailing space" })

-- Windows
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Strip trailing space" })

-- Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
