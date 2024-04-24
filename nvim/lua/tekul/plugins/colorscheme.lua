return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = "false",
            })

            -- vim.cmd("colorscheme tokyonight")
        end
    },

    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require('rose-pine').setup({
    --             disable_background = true,
    --             styles = {
    --                 italic = false,
    --             },
    --         })
    --
    --         vim.cmd("colorscheme rose-pine")
    --     end
    -- },

    {
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                transparent = false,
            })

            vim.cmd("colorscheme kanagawa-dragon")
        end
    },
}
