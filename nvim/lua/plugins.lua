vim.g.mapleader = " "

vim.pack.add({
    { src = "https://github.com/rebelot/kanagawa.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/vieitesss/miniharp.nvim", version = vim.version.range("v*"), },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("^1"),
    },
    {
        src = "https://github.com/kylechui/nvim-surround",
        version = vim.version.range("4.x"),
    },
})

require("nvim-web-devicons").setup({})

require("kanagawa").setup({ transparent = false })
vim.cmd("colorscheme kanagawa-dragon")

-- Fzf-Lua
local fzf = require("fzf-lua")
fzf.setup({})

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files in cwd" })
vim.keymap.set("n", "<leader>pf", fzf.vcs_files, { desc = "Find files in git or jj project" })
vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Find recent files" })
vim.keymap.set("n", "<leader>rg", fzf.grep, { desc = "Find a pattern with rg" })

-- Override basic versions
vim.keymap.set("n", "<leader>rr", fzf.registers, { desc = "Show registers "})
vim.keymap.set("n", "<leader>bb", fzf.buffers, { desc = "Show loaded buffers" })
vim.keymap.set("n", "<leader>mm", fzf.marks, { desc = "Show marks" })

-- Blink
require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
        preset = "enter",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },

    -- sources = { default = { "lsp" } }
})

-- Miniharp
local miniharp = require('miniharp')
miniharp.setup({})

vim.keymap.set('n', '<leader>m', miniharp.toggle_file, { desc = 'miniharp: toggle file mark' })
vim.keymap.set('n', '<C-n>',     miniharp.next,        { desc = 'miniharp: next file mark' })
vim.keymap.set('n', '<C-p>',     miniharp.prev,        { desc = 'miniharp: prev file mark' })
vim.keymap.set('n', '<leader>l', miniharp.show_list,   { desc = 'miniharp: toggle marks list' })
vim.keymap.set('n', '<leader>L', miniharp.enter_list,  { desc = 'miniharp: enter marks list' })

vim.keymap.set('n', '<leader>1', function() miniharp.go_to(1) end, { desc = 'miniharp: go to mark 1' })
vim.keymap.set('n', '<leader>2', function() miniharp.go_to(2) end, { desc = 'miniharp: go to mark 2' })
vim.keymap.set('n', '<leader>3', function() miniharp.go_to(3) end, { desc = 'miniharp: go to mark 3' })
vim.keymap.set('n', '<leader>4', function() miniharp.go_to(4) end, { desc = 'miniharp: go to mark 4' })

