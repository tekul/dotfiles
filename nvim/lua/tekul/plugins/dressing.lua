return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
        local dressing = require("dressing")
        dressing.setup({
            input = {
                -- Disable vim.ui.input implementation 
                enabled = false,
            }
        })
    end,
}

