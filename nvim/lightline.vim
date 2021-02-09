" Mode is shown in the status line
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch' ],
      \             [ 'readonly', 'filename' ],
      \             [ 'lsp' ]],
      \   'right': [['lineinfo'], ['percent'], ['charvaluehex', 'fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'lsp': 'LspStatus',
      \   'gitbranch': 'LightLineBranch',
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

function! LightLineBranch()
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
endfunction

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
endfunction

function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
       return luaeval("require('lsp-status').status()")
    endif
    return ''
endfunction
