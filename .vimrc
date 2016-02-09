syntax on
set nu
"set relativenumber
set hlsearch
set mouse=a

" underline in insert mode
inoremap <C-c> <ESC>
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" search in new tab
nmap <leader>a :tab split<CR>:Ack ""<Left>
nmap <leader>A :tab split<CR>/<C-r><C-w><CR>:Ack <C-r><C-w><CR>

" save with control-s
map! <C-s> <Esc>:w<CR>
map <C-s> :w<CR>

map <C-q> :NERDTree<CR>
map! <C-q> <ESC>:NERDTree<CR>

" switch between windows with Alt
execute "set <M-h>=\eh"
nnoremap <M-h> <C-w>h
execute "set <M-l>=\el"
nnoremap <M-l> <C-w>l
execute "set <M-j>=\ej"
nnoremap <M-j> <C-w>j
execute "set <M-k>=\ek"
nnoremap <M-k> <C-w>k

" scale window width with Alt-+ and Alt--
execute "set <M-+>=\e+"
nnoremap <M-+> 5<C-w>>
execute "set <M-->=\e-"
nnoremap <M--> 5<C-w><

" move quickly on a line
nmap <C-h> 8h
nmap <C-l> 8l

" move quickly on page
nmap <C-k> 5k
nmap <C-j> 5j

" move in input mode
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-e> <Up>
imap <C-d> <Down>

let g:ConqueTerm_ReadUnfocused = 1

execute pathogen#infect()
