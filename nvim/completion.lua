local cmp = require'cmp'

-- See 'cmp' keymappings example
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        -- { name = 'buffer' },
    },
    -- mapping = {
    --     ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    --     ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    --     ['<C-e>'] = cmp.mapping.close(),
    --     ['<cr>'] = cmp.mapping.confirm({select = true})
    -- }
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),

        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

        ["<Tab>"] = cmp.mapping(function(fallback)
           if cmp.visible() then
             cmp.select_next_item()
           elseif vim.fn["vsnip#available"](1) == 1 then
             feedkey("<Plug>(vsnip-expand-or-jump)", "")
           elseif has_words_before() then
             cmp.complete()
           else
             fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
           end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
           if cmp.visible() then
             cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
             feedkey("<Plug>(vsnip-jump-prev)", "")
           end
        end, { "i", "s" }),


        ['<CR>'] = cmp.mapping.confirm({select = false})
    }
})
