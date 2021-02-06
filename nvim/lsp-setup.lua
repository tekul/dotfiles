local lsp = require'lspconfig'
local completion = require'completion'
-- local log = require 'vim.lsp.log'
-- log.set_level(2)

local capabilities = {
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = false
            },
        },
    },
}

-- function to attach completion when setting up lsp
local on_attach = function(client)
    completion.on_attach(client)
end


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

lsp.rust_analyzer.setup {
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = true,
                disabled = {"unresolved-proc-macro"},
                enableExperimental = true,
                warningsAsHint = {},
            },
        },
    },
    capabilities = capabilities,
}

lsp.elmls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        elmLS = {
            disableElmLSDiagnostics = true,
        }
    };
}

