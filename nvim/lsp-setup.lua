local lsp = require'lspconfig'
local completion = require'completion'
-- local log = require 'vim.lsp.log'
-- log.set_level(2)

-- function to attach completion when setting up lsp
local on_attach = function(client)
    completion.on_attach(client)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

lsp.rust_analyzer.setup {
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehaviour = "full",
                importPrefix = "plain",
            },

            callInfo = {
                full = true,
            };

            cargo = {
                loadOutDirsFromCheck = true
            },

            checkOnSave = {
                allFeatures = true,
            },

            procMacro = {
                enable = true,
            },
            diagnostics = {
                enable = true,
                disabled = { "unresolved-proc-macro" },
                enableExperimental = true,
                warningsAsHint = {},
            },
        },
    },
}

lsp.elmls.setup {
    on_attach = on_attach,
    settings = {
        elmLS = {
            disableElmLSDiagnostics = true,
        }
    };
}

