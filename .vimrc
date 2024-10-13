" $VIMRUNTIME=//share/vim/vim<version>.

" Vim sẽ tải $VIMRUNTIME/defaults.vim nếu người dùng không có vimrc.
" Điều này xảy ra sau khi /etc/vim/vimrc(.local) được tải, vì vậy nó sẽ ghi đè
" bất kỳ thiết lập nào trong các tệp này.
" Nếu bạn không muốn điều đó xảy ra, hãy bật tùy chọn dưới đây để ngăn
" defaults.vim được tải.
let g:skip_defaults_vim = 1

" Nếu bạn muốn _sử dụng_ các thiết lập của defaults.vim nhưng ghi đè chúng
" trong vimrc hoặc từ người dùng, hãy mở tệp này.
" source $VIMRUNTIME/defaults.vim

" Tất cả các thiết lập được Debian định nghĩa trong $VIMRUNTIME/debian.vim và
" được tải bởi lệnh :runtime.
runtime! debian.vim

" Bật tính năng không tương thích với Vi
set nocompatible

" Bật tỏ sáng cú pháp
syntax on

" Đặt nền tối
set background=dark

" Tự động lưu file trước các lệnh :next và :make
set autowrite

" Hiển thị số dòng
set number

" Sử dụng 4 khoảng trắng khi nhấn phím Tab
set tabstop=2
set shiftwidth=2
set expandtab

" Định dạng dòng trạng thái hiển thị thông tin file
set statusline=%F\ %y\ %m\ %r\ %h\ %w\ %p%%\ %l,%c\ %<%{&filetype}\ %M\ %P
set laststatus=2

" Bật tính năng tìm kiếm thông minh
set hlsearch
set incsearch

" Bật tính năng tìm kiếm không phân biệt chữ hoa chữ thường
set ignorecase
set smartcase

" Lưu lịch sử tìm kiếm và thay thế
set history=9999

" Bật tính năng hoàn tác không giới hạn
set undofile
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp//

" Bật chuột
set mouse=a

" Khởi tạo Vundle
set nocompatible
filetype off

" Thiết lập đường dẫn cho Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Khởi tạo vim-plug
call plug#begin('~/.vim/plugged')

" Danh sách các plugin
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'joshdick/onedark.vim'
"Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Shougo/deoplete.nvim'
"Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'folke/which-key.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-sensible'     " Plugin cơ bản cho Vim
Plug 'scrooloose/nerdtree'     " Trình duyệt file dạng cây
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " Tìm kiếm nhanh với fzf
Plug 'itchyny/lightline.vim'	" Thanh trạng thái nhẹ nhàng
Plug 'Valloric/YouCompleteMe'	" Tự động hoàn thành mã
Plug 'airblade/vim-gitgutter'	" Hiển thị thay đổi Git bên lề Vim.
Plug 'preservim/nerdcommenter'	" Dễ dàng bình luận dòng code
Plug 'tpope/vim-fugitive'		" Tích hợp Git vào Vim.

" Cài đặt fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Cài đặt fzf.vim
Plug 'junegunn/fzf.vim'
filetype plugin indent on

" Cấu hình fzf
let g:fzf_preview_window = ['up:30%']


" Kết thúc cấu hình vim-plug
call plug#end()

" Phím tắt
vnoremap <C> :%y+!
map <C-t> :tabnew!<CR>
map <C-s> :wq!<CR>
map <C-x> :x!<CR>
nnoremap <C-a> ggVG

" Tổ hợp phím Ctrl + a để chọn toàn bộ văn bản
nnoremap <C-a> ggVG

" Lệnh lưu file với phím Alt + s
nnoremap <A-s> :call SaveAs()<CR>

" Undo/Redo với phím Ctrl + r
inoremap <C-r> <C-o>:undo<CR>
inoremap <A-r> <C-o>:redo<CR>
nnoremap <C-r> :undo<CR>
nnoremap <A-r> :redo<CR>

" Undo Ctrl + U
inoremap <C-u> <C-o>:undo<CR>
inoremap <A-u> <C-o>:redo<CR>
noremap <C-u> :undo<CR>
nnoremap <A-u> :redo<CR>

" Thoát Vim với phím Q hoặc Ctrl + C
nnoremap q :q<CR>
inoremap q <Esc>:q!<CR>
nnoremap <C-c> :q!<CR>

" Lưu và thoát với Ctrl + Q
nnoremap <Esc> :wq!<CR>
inoremap <C-q> <C-o>:wq!<CR>


" Xóa dòng với Ctrl + D
nnoremap d <C-o>dd<CR>
inoremap <C-d> <C-o>dd<CR>

" Cấu hình nvim-compe
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.nvim_lsp = v:true

