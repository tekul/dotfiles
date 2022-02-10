
call plug#begin('~/.vim/plugged')

let g:plug_url_format = 'git@github.com:%s.git'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'phaazon/hop.nvim'

" Colour schemes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'pacha/vem-dark'

" Status line
Plug 'itchyny/lightline.vim'

" Common configurations for LSP
Plug 'neovim/nvim-lspconfig'

" Extentions to LSP, providing type inlay hints
Plug 'tjdevries/lsp_extensions.nvim'

" LSP Code action lightbulb
Plug 'kosayoda/nvim-lightbulb'

" LSP status bar integration
Plug 'nvim-lua/lsp-status.nvim'

" Autocompletion and snippets
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

Plug 'vimwiki/vimwiki'

call plug#end()


syntax enable
set showmatch
set matchtime=3
filetype plugin indent on
set termguicolors
set signcolumn=yes
"set scrolloff=10
set list

" Lightline
source ~/.config/nvim/lightline.vim
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

"let g:zenburn_high_Contrast = 1
colorscheme zenburn
" Override default zenburn dark bg to make it a bit lighter
hi Normal guifg=#dcdccc guibg=#222222 ctermfg=188 ctermbg=234
" Make bracket matching more visible
hi MatchParen ctermbg=188 ctermfg=234 guibg=#555555 guifg=NONE

"colorscheme vem-dark

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set hidden
set relativenumber
"set number
set incsearch
set encoding=utf-8

" Use undofile for persistent undo
set undofile
set undodir=~/.vim/undodir

nnoremap ; :

let mapleader=' '
let maplocalleader=' '
set notimeout

" Show whitespace, line numbers
nnoremap <leader>il :set invlist<CR>
nnoremap <leader>nn :set invnumber<CR>
nnoremap <leader>rn :set invrelativenumber<CR>

" Recording playback
noremap Q @q

" Reload/edit config
nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>

" Better moving around wrapped lines
" nnoremap <silent> k gk
" nnoremap <silent> j gj
" nnoremap <silent> 0 g0
" nnoremap <silent> $ g$

" Ctrl-S to save
inoremap <C-s> <ESC> :w <CR>
nnoremap <C-s> :w <CR>

" Map F7 and F8 to next/previous buffer
inoremap <F7> <ESC> :bprev <CR>
inoremap <F8> <ESC> :bnext <CR>
inoremap <F9> <ESC> :bnext <CR>
nnoremap <F7> :bp <CR>
nnoremap <F8> :bn <CR>
nnoremap <F9> :bn <CR>
nnoremap <F10> :b# <CR>

" Other buffer navigation using space
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>b# :b#<CR>

" Quickfix/Local list navigation
nnoremap <silent> <leader>cn :cnext<CR>zz
nnoremap <silent> <leader>cp :cprev<CR>zz
nnoremap <silent> <leader>cf :cfirst<CR>zz
nnoremap <silent> <leader>cl :clast<CR>zz
nnoremap <silent> ]q :cnext<CR>zz
nnoremap <silent> [q :cprev<CR>zz
nnoremap <silent> [Q :cfirst<CR>zz
nnoremap <silent> ]Q :clast<CR>zz

nnoremap <silent> <leader>ll :lopen<CR>zz
nnoremap <silent> <leader>ln :lnext<CR>zz
nnoremap <silent> <leader>lp :lprev<CR>zz

" Hop
lua require'hop'.setup()
" Conflicts with wincmd
"nnoremap <silent><C-w> :HopWord<CR>
nnoremap <C-c> :HopChar1<CR>
nnoremap <silent><leader>cc :HopChar1<CR>
nnoremap <silent><leader>hl :HopLine<CR>
hi HopNextKey guifg=#f8ff38
hi HopNextKey1 guifg=#ffc038
hi HopNextKey2 guifg=#f8ff38

" Strip trailing whitespace
nnoremap <silent> <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

autocmd FileType rust,haskell,java,git,html,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

" Turn off search highlighting (gets turned back on when searching)
nnoremap <silent> <Leader>/ :noh<cr>

" Select newly pasted text
nnoremap <leader>v V`]

" Alternative escape
inoremap jk <ESC>
vnoremap jk <ESC>
inoremap jj <ESC>

" Avoid showing extra messages when using completion
set shortmess+=c

"Show registers
nnoremap <silent> <leader>rr :registers<CR>

" Send deleted chars to 'black hole' register
noremap x "_x

" fzf bindings
nnoremap <silent> <leader>bb :Buffers<CR>
"nnoremap <silent> <leader>ff :lua require'telescope.builtin'.find_files{}<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>pf :GitFiles<CR>
nnoremap <silent> <leader>fg :GitFiles<CR>
nnoremap <silent> <leader>rg :Rg<CR>
nnoremap <silent> <leader>ag :Ag<CR>
nnoremap <silent> <leader>fo :History<CR>
nnoremap <silent> <leader>fr :History<CR>

" Configure cmp
" set completeopt=menuone,noselect

luafile ~/.config/nvim/completion.lua

" Configure lsp
luafile ~/.config/nvim/lsp-setup.lua

" Code navigation shortcuts as found in :help lsp
" This overwrites the mapping for jumping to a tag in help files
" so an alternative is needed.
"nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" rust-analyzer does not yet support goto declaration
" re-mapped `gd` to definition
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
"
augroup locallist
    autocmd!
    " Populate locallist with lsp diagnostics automatically
    autocmd User LspDiagnosticsChanged :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
augroup END

" Formatting
nnoremap <silent> <leader>F <cmd>lua vim.lsp.buf.formatting()<CR>

" Show lightbulb if code action is available
lua vim.fn.sign_define('LightBulbSign', { text = "", texthl = "GitGutterAdd", linehl="", numhl="" })
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" trigger code actions. Note that ga is the standard  shortcut
" for showing char codes at cursor.
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.diagnostic.open_float({focusable = false })

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>zz
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>zz
nnoremap <silent> <leader>ep <cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { focusable = false } })<CR>zz
nnoremap <silent> <leader>en <cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { focusable = false } })<CR>zz

" Enable type inlay hints
nnoremap <silent> <Leader>T :lua require'lsp_extensions'.inlay_hints{ prefix = ""}<CR>
nnoremap <silent> <Leader>tt :lua require'lsp_extensions'.inlay_hints{ only_current_line = true, prefix = "" }<CR>

" Use markdown in vim wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

