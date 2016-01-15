syntax on
set nu
"set relativenumber
set hlsearch
set mouse=a
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" search in new tab
nmap <leader>a :tab split<CR>:Ack ""<Left>
nmap <leader>A :tab split<CR>/<C-r><C-w><CR>:Ack <C-r><C-w><CR>

let g:ConqueTerm_ReadUnfocused = 1

execute pathogen#infect()
