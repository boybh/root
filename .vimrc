"$VIMRUNTIME=//share/vim/vim<version>.
"
" Vim sẽ tải $VIMRUNTIME/defaults.vim nếu người dùng không có vimrc.
" Điều này xảy ra sau khi /etc/vim/vimrc(.local) được tải, vì vậy nó sẽ ghi đè
" bất kỳ thiết lập nào trong các tệp này.
"
" Nếu bạn không muốn điều đó xảy ra, hãy bỏ chú thích dòng dưới đây để ngăn
" default.vim được tải.
"let g:skip_defaults_vim = 1
"
" Nếu bạn muốn _sử dụng_ các thiết lập của default.vim, nhưng để vimrc hệ thống hoặc
" người dùng ghi đè các thiết lập của nó, hãy bỏ chú thích dòng dưới đây.
" source $VIMRUNTIME/defaults.vim

" Tất cả các thiết lập đặc thù Debian được định nghĩa trong $VIMRUNTIME/debian.vim và
" được tải bởi lệnh :runtime bạn có thể tìm thấy dưới đây. Nếu bạn muốn thay đổi
" bất kỳ thiết lập nào trong đó, bạn nên làm điều đó trong tệp này hoặc
" /etc/vim/vimrc.local, vì debian.vim sẽ bị ghi đè mỗi khi gói vim được cập nhật. Nên làm thay đổi
" sau khi tải debian.vim để các thiết lập của bạn có hiệu lực.

"runtime! debian.vim

" Bỏ chú thích dòng tiếp theo để làm Vim tương thích hơn với Vi
" CHÚ Ý: debian.vim thiết lập 'nocompatible'. Việc thiết lập 'compatible' thay đổi
" nhiều tùy chọn, vì vậy bất kỳ tùy chọn nào khác nên được thiết lập SAU khi thay đổi
" 'compatible'.
" set compatible

" Các phiên bản Vim5 và sau này hỗ trợ tô sáng cú pháp. Bỏ chú thích dòng tiếp theo để
" bật tô sáng cú pháp mặc định.
" syntax on

" Nếu sử dụng nền tối trong khu vực chỉnh sửa và tô sáng cú pháp, hãy bật tùy chọn này.
set background=dark

" Bỏ chú thích để Vim nhảy đến vị trí cuối cùng khi mở lại một tệp.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Bỏ chú thích để Vim tải các quy tắc và plugin căn chỉnh theo loại tệp được phát hiện.
"filetype plugin indent on

" Các thiết lập dưới đây bị bỏ chú thích vì chúng khiến vim hoạt động rất khác
" so với Vi thông thường. Chúng được khuyến nghị cao.
set showcmd		" Hiển thị lệnh (một phần) trong dòng trạng thái.
set showmatch		" Hiển thị dấu ngoặc khớp.
set ignorecase		" Tìm kiếm không phân biệt chữ hoa chữ thường
set smartcase		" Tìm kiếm thông minh với chữ hoa chữ thường
" set incsearch		" Tìm kiếm gia tăng
set autowrite		" Tự động lưu trước các lệnh như :next và :make
" set hidden		" Ẩn các buffer khi chúng bị bỏ qua
" set mouse=a		" Kích hoạt việc sử dụng chuột (tất cả các chế độ)

" Tải một tệp cấu hình toàn cầu nếu có
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

" Kích hoạt số dòng
set number

" Enable scrollbar
"set scrolloff=15        " Number of lines to keep above and below the cursor
"set sidescrolloff=15    " Number of columns to keep left and right of the cursor

" Sử dụng 4 khoảng trắng khi nhấn phím Tab
set tabstop=1
set shiftwidth=1
set expandtab

" Cấu hình dòng trạng thái để hiển thị thông tin phím tắt
set statusline=%F\ %y\ %m\ %r\ %h\ %w\ %p%%\ %l,%c\ %<%{&filetype}\ %M\ %P\
set laststatus=2
set clipboard=unnamed,unnamedplus
"set clipboard=unnamedplus
"colorscheme gruvboxt
"set shortmess+=I
" Hiển thị tô sáng cú pháp"
syntax on

" Tự động căn chỉnh dấu
set autoindent
"set smartindent
set hidden

" Kích hoạt tô sáng tìm kiếm
set hlsearch
set incsearch

" Kích hoạt chế độ hiển thị dòng dài xuống dòng
set wrap

" Lưu lịch sử tìm kiếm và thay thế
set history=9999

" Kích hoạt cài đặt tạm thời
set undofile
set backup
set backupdir=~/.config/.vim/backup//
set directory=~/.config/.vim/tmp//

"Kích hoạt chuột
set mouse=a

" Khởi tạo Vundle
set nocompatible
filetype off

" Khởi tạo vim-plug
call plug#begin('~/.config/.vim/plugged')


" Danh sách các plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
"Plug 'hrsh7th/nvim-compe'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'folke/which-key.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'


" Cài đặt fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Cài đặt fzf.vim
Plug 'junegunn/fzf.vim'
filetype plugin indent on

" Cấu hình fzf
let g:fzf_preview_window = ['up:30%']

" Kết thúc phần cài đặt plugin
call plug#end()


" Copy c
"vnoremap <c> :%y+!

"All Chế độ
"map <C-t> :tabnew!<CR>
"map <C-s> :wq!<CR>
"map <C-x> :x!<CR>
inoremap <C-x>:x!<CR>
"map <C-a> :%y+

" Thiết lập phím tắt Ctrl+a để chọn toàn bộ văn bản
nnoremap <C-a> ggVG

" Ánh xạ trong chế độ Normal, Insert và Visual:
" Ctrl + t mở tab mới
"nnoremap <C-t> :tabnew<CR>
"inoremap <C-t> <C-o>:tabnew<CR>
"vnoremap <C-t> :tabnew<CR>

" Gán Alt + s để gọi hàm SaveAs
"nnoremap <A-s> :call SaveAs()<CR>
"inoremap <C-s> <C-o>:w<Space>

" Undo Ctrl + U
inoremap <C-r> <C-o>:undo<CR>
inoremap <A-r> <C-o>:redo<CR>
noremap <C-r> :undo<CR>
nnoremap <A-r> :redo<CR>

" Thoát Vim với phím Q hoặc Ctrl + C
nnoremap q :q<CR>
inoremap q <Esc>:q!<CR>
nnoremap <C-c> :q!<CR>

"Lưu file và thoát với Ctrl + Q
nnoremap <Esc> :wq!<CR>
inoremap <C-q> <C-o>:wq!<CR>
inoremap <Esc> <C-o>:wq!<CR>
"map <Esc> :wq!<CR>

" Delete một dòng đơn với Ctrl + D
nnoremap d <C-o>dd<CR>
inoremap <C-d> <C-o>dd<CR>

"Kích hoạt Plugins"
" Cấu hình nvim-compe
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.nvim_lsp = v:true

