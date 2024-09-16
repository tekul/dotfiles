return {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml' },
    settings = {
        ['rust-analyzer'] = {
            check = { command = "clippy" },
            checkOnSave = true,
            diagnostics = {
                enable = true,
                experimental = { enable = true },
            }
        }
    }
}

