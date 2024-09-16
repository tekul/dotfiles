-- Set logging. Log is in .local/state/nvim
-- local log = require("vim.lsp.log")
-- log.set_level("INFO")
-- Also run 'checkhealth vim.lsp' for info

vim.lsp.enable({
  "lua_ls",
  -- "ts_ls",
  "rust-analyzer",
})

local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", {}),

    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }
        local fzf_lua = require('fzf-lua')

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gr", fzf_lua.lsp_references, opts)

        opts.desc = "Show LSP declaration"
        -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gD", fzf_lua.lsp_declarations, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", fzf_lua.lsp_definitions, opts)
        -- keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", fzf_lua.lsp_implementations, opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", fzf_lua.lsp_typedefs, opts) -- show lsp type definitions

        opts.desc = "See available LSP code actions"
        keymap.set({ "n", "v" }, "<leader>ca", fzf_lua.lsp_code_actions, opts) -- see available code actions, in visual mode will apply to selection
        -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "gR", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>ee", fzf_lua.diagnostics_document, opts) -- show  diagnostics for file

        opts.desc = "Show workspace diagnostics"
        keymap.set("n", "<leader>EE", fzf_lua.diagnostics_workspace, opts) -- show diagnostics for workspace

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", "<cnd>lsp stop<CR>", opts) -- mapping to restart lsp if necessary
    end,
})

vim.diagnostic.config({
    -- virtual_text = true,
    virtual_lines = true,
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
    -- Change the Diagnostic symbols in the sign column (gutter)
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            -- [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            -- [vim.diagnostic.severity.ERROR] = "󰅚 ",
            -- [vim.diagnostic.severity.WARN] = "󰀪 ",
            -- [vim.diagnostic.severity.INFO] = "󰋽 ",
            -- [vim.diagnostic.severity.HINT] = "󰌶",
        },
    },
})

