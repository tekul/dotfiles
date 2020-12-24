
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'arcticicestudio/nord-vim'

" Common configurations for LSP
Plug 'neovim/nvim-lspconfig'

" Extentions to LSP, providing type inlay hints
Plug 'tjdevries/lsp_extensions.nvim'

" Autocompletion for LSP
Plug 'nvim-lua/completion-nvim'
call plug#end()


syntax enable
filetype plugin indent on

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set hidden
set relativenumber
set incsearch
set encoding=utf-8

set undofile            " Use undofile for persistent undo
set undodir=~/.vim
colorscheme nord

" Leader and local leader
let mapleader=' '
let maplocalleader='\ '

" Reload config
nnoremap <leader>rv :source $MYVIMRC<cr>

" Remove the F1 binding and change to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map F7 and F8 to next/previous buffer
inoremap <F7> <ESC> :bp <CR>
inoremap <F8> <ESC> :bn <CR>
inoremap <F9> <ESC> :bn <CR>
nnoremap <F7> :bp <CR>
nnoremap <F8> :bn <CR>
nnoremap <F9> :bn <CR>

" Spacemacs style buffer commands
nnoremap <silent> <leader>bb :buffers<CR>
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bd :bd<CR>

" Strip trailing whitespace
nnoremap <silent> <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

autocmd FileType rust,haskell,java,vim,git,html,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

" Turn off search highlighting (gets turned back on when searching)
nnoremap <silent> <Leader>/ :noh<cr>

" Select newly pasted text
nnoremap <leader>v V`]

" Alternative escape
inoremap jk <ESC>

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c


" Configure lsp
luafile ~/.config/nvim/lsp-setup.lua

" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" rust-analyzer does not yet support goto declaration
" re-mapped `gd` to definition
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" trigger code actions. Note that ga is the standard  shortcut
" for showing char codes at cursor.
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Use tab for completion
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
" set signcolumn=yes

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>ep <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>en <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Enable type inlay hints
nnoremap <silent> <Leader>T :lua require'lsp_extensions'.inlay_hints{ prefix = ""}<CR>
nnoremap <silent> <Leader>tt :lua require'lsp_extensions'.inlay_hints{ only_current_line = true, prefix = "" }<CR>

