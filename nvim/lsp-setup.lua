local lsp = require'lspconfig'
local lsp_status = require('lsp-status')

-- local log = require 'vim.lsp.log'
-- log.set_level(2)

-- lsp_status.register_progress()
lsp_status.config({
    kind_labels = {},
    current_function = false,
    indicator_separator = ' ',
    indicator_errors = '',
    indicator_warnings = '',
    indicator_info = '',
    indicator_hint = '!',
    indicator_ok = '',
    select_symbol = nil,
    status_symbol = '',
    spinner_frames = { '-', '\\', '|', '/' },
})

-- function to attach completion when setting up lsp
local on_attach = function(client)
    -- if client.config.flags then
    --     client.config.flags.allow_incremental_sync = true
    -- end
    -- lsp_status.on_attach(client)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = false,
    }
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {focusable = false})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp.rust_analyzer.setup {
    on_attach=on_attach,
    capabilities = capabilities,
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
                command = "clippy",
                allFeatures = true,
            },

            procMacro = {
                enable = true,
            },
            diagnostics = {
                enable = true,
                disabled = { "unresolved-proc-macro", "missing-unsafe" },
                enableExperimental = true,
                warningsAsHint = {},
            },
        },
    },
}

lsp.elmls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        elmLS = {
            disableElmLSDiagnostics = false,
        }
    };
}

lsp.hls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        languageServerHaskell = {
            formatOnImportOn = false,
        },
    };
}
