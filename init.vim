
"________Configuracion basica
syntax on
syntax enable 				"activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++
set encoding=utf-8 			"permite setear la codificación de archivos para aceptar caracteres especiales
set sw=2 				"la indentación genera 4 espacios

set numberwidth=3
set laststatus=2                " línea de estado aún no está visible
set showcmd
set showmatch                   "para los parentesis, resaltan
set noerrorbells		"no de sonidos de errores 

set autoindent                  "Aplica identacion automatica
set tabstop=2                   "indica cuantos espacios tiene la tabulacion
set shiftwidth=2

set expandtab                   "agregamos carracteriscas 

set smartindent
set nowrap			"para la que la linea no te la ponga debajo
set incsearch
set ignorecase			"para buscar palabras tanto mayus como minus
"set clipboard=unnamedplus	"para copiar y pegar
set encoding=utf-8		"caracteres internacionales
set cursorline
set termguicolors
set number 				"muestra los numeros de cada linea en la parte izquierda 
set relativenumber 			"la distribucion de los numeros en lineas de manera relativa
set mouse=a 				"permite la interaccion con el mouse
"set noshowmode				"me deja de mostrar el modo en el que estamos 'normal, insert, visual, etc'
set nowrap				"el texto en una linea no baja a la siguiente, solo continua en la misma hasta el infinito.
set noswapfile				"para evitar el mensaje que sale al abrir algunos archivos sobre swap.
set clipboard=unnamedplus			"para poder utilizar el portapapeles del sistema operativo 'esto permite poder copiar y pegar desde cualquier parte a nvim y viceversa.	
" set statusline+=%F
set clipboard=unnamed


"------Instalacion
"pulggins----------------------------------------------------------------------------------------------------------------"
call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'


"IDE
"para poner moverse rapidamente 
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'               "ya viene conficgurado, sirve para navegar por las ventanas abierrtas <c-h> izquierda


Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

"-----Autocompletado
"Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"---Plugin Javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

"Pluggin snippet javascript (atajos)
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

"Plug Emmet----
Plug 'mattn/emmet-vim'    


"----Plug comentario
Plug 'tpope/vim-commentary'

"----Plug indentación
Plug 'Yggdroot/indentLine'

"----Plug Navegador de Archivos

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"---Plug navegador de archivos
Plug 'scrooloose/nerdtree'

"--------Plug nerd fonts
Plug 'ryanoasis/vim-devicons' "devicons

"----Plung sintaxis
Plug 'vim-syntastic/syntastic'

"--------- Test
"
Plug 'vim-test/vim-test'

"------Plug fzf----Buscar entre archivos del proy
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                     
"----https://github.com/junegunn/fzf.vim

"------Plug vimspector----DEBUG
Plug 'puremourning/vimspector'




call plug#end()
"--------------------------------------------

"----SHELL config----

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/zsh
endif

set shell=powershell.exe


"---------Gruvbox Configuracion"
set background=dark
let g:gruvbox_material_background='hard'                "also try medium, ligth, dark -----this is de backgroundcolor
colorscheme gruvbox

"---Maptecla lider
let mapleader=' '             "la tecla lider es un spacion, ya no :

nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>q! :q!<CR>

nmap <leader>s <Plug>(easymotion-s2)

"------vim test-------
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"-----config Vimspector-----
"
"config basada en visual studio code----
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
"let g:vimspector_enable_mappings = 'HUMAN'
"-Para personalizar  https://www.youtube.com/watch?v=wIU6Roqmljs

"----config nerdtree
" nnoremap <silent> <
let g:webdevicons_anable_nerdtree =1
let g:webdevicons_conceal_nerdtree_brackets =1

map <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>                        "moverse por la bentanas de arriba

"--------config vim-airline
let g:airline_theme='solarized light'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1

map <C-z> :bprevious<CR>                "cambiar de buffer (ventanas) 
map <C-x> :bnext<CR>

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1


"----
" let g:airline_section_b = airline#section#create(['mode', ' ' , 'branch']) 


"-------congig sintaxis-----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"----LSP Config------
lua << EOF
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF

"-----snippet (atajos) javascript, config 
"https://github.com/mlaursen/vim-react-snippets
let g:UtilSnipsExpandTrigger="<CR>"



"----commentary config
nnoremap <space>/ :Commentary<CR>:
" let g:python3_host_prog ="~/AppData/Local/Programs/Python/Python310"
" let g:python3_host_prog = '/path/to/python3'
"Esto meter si daria error en chekhelp sobre python no found
"python3 -m pip install --user --upgrade pynvim

"-------EMMET confing
let g:user_emmet_mode='n'                               "en modo Normal
let g:user_emmet_leader_key=','                         "con doble coma se autocompleta la etiqueta de apertura y cierre
let g:user_emmet_settings={
      \ 'javascript':{
      \ 'extends':'jsx'
      \ }
      \ }
      

"---------CONFIG Prettier---------------
command! -nargs=0 Prettier :CocCommand Prettier.formatFile
nnoremap <C-D> :Prettier<CR>:                                   "contro +D se ejecuta el Prettier"

"------Config comentario


"------COC config predeterminado, estraido de git https://github.com/neoclide/coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
