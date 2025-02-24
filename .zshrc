# Tăng giới hạn FUNCNEST (ví dụ: 100)
export FUNCNEST=300

export ZSH="$HOME/.oh-my-zsh"
WORDCHARS=${WORDCHARS//[\/]}
#source /mnt/e/config/cauhinh/cai_vi.sh
#----------------------------------
# Bỏ dấu comment dòng dưới đây để sử dụng hoàn thành lệnh phân biệt chữ hoa, chữ thường.
# CASE_SENSITIVE="true"
# Bỏ dấu comment dòng dưới đây để sử dụng hoàn thành lệnh không phân biệt dấu gạch nối.
# Chế độ phân biệt chữ hoa, chữ thường phải tắt. _ và - sẽ thay thế lẫn nhau.
#HYPHEN_INSENSITIVE="true"
# Bỏ dấu comment một trong các dòng dưới đây để thay đổi chế độ cập nhật tự động.
# zstyle ':omz:update' mode disabled  # tắt cập nhật tự động
zstyle ':omz:update' mode auto      # cập nhật tự động mà không hỏi
# zstyle ':omz:update' mode reminder  # chỉ nhắc nhở tôi khi đến lúc cập nhật
# Bỏ dấu comment dòng dưới đây để thay đổi tần suất cập nhật tự động (theo ngày).
# zstyle ':omz:update' frequency 13
# Bỏ dấu comment dòng dưới đây nếu việc dán URL và văn bản bị lỗi.
#DISABLE_MAGIC_FUNCTIONS="true"
# Bỏ dấu comment dòng dưới đây để tắt màu trong lệnh ls.
# DISABLE_LS_COLORS="true"
# Bỏ dấu comment dòng dưới đây để tắt tự động đặt tiêu đề terminal.
#DISABLE_AUTO_TITLE="true"
# Bỏ dấu comment dòng dưới đây để kích hoạt sửa lỗi lệnh tự động.
#ENABLE_CORRECTION="true"
# Bỏ dấu comment dòng dưới đây để hiển thị dấu chấm đỏ trong khi chờ hoàn thành lệnh.
# Bạn cũng có thể đặt thành một chuỗi khác để hiển thị thay vì dấu chấm đỏ mặc định.
# Ví dụ: COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Cảnh báo: thiết lập này có thể gây vấn đề với dòng nhắc nhiều dòng trong zsh < 5.7.1 (xem #5765)
#COMPLETION_WAITING_DOTS="true"
# Bỏ dấu comment dòng dưới đây nếu bạn muốn tắt đánh dấu các tệp không theo dõi
# dưới VCS là "dirty". Điều này làm kiểm tra trạng thái repository nhanh hơn
# cho các repository lớn.
#DISABLE_UNTRACKED_FILES_DIRTY="dirty"
DISABLE_UNTRACKED_FILES_DIRTY="true"
# Đường dẫn đến thư mục custom của bạn
export ZSH_CUSTOM="$HOME/.config/custom"

# PLUGIN oh-my-zsh------------------------
#------------------------------------
# Đường dẫn đến file lưu plugin
PLUGIN_FILE="$CAUHINH/plugin_omz.sh"

#--------------------------------#
if [ -f "$PLUGIN_FILE" ]; then
    source "$PLUGIN_FILE"
fi

#--------------------------------#
fpath=($ZSH/{functions,completions} $ZSH_CUSTOM/{functions,completions} $fpath)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+=$ZSH_CUSTOM/plugins/fzf-tab
source "$ZSH/oh-my-zsh.sh"
#source "$ZSH/lib/completion.zsh"
source "$ZSH/lib/key-bindings.zsh"

# Đặt theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Cấu hình người dùng
# export MANPATH="/usr/local/man:$MANPATH"

#-------------------------------------------------------------
#source /mnt/e/config/cauhinh/sualoi.zsh

#--------------------------------------------------------------------

# Trình soạn thảo ưa thích cho các phiên làm việc cục bộ và từ xa
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vi'
fi

# Cờ biên dịch
#export ARCHFLAGS="-arch $(uname -m)"

[[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ]] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh


# =============================================== #
# Cấu hình Zsh của bạn - gọn gàng và dễ quản lý   #
# =============================================== #

# 1. Thiết lập môi trường cơ bản
# ------------------------------
export TERM="xterm-256color"          # Đặt terminal hỗ trợ 256 màu
export LANG="vi_VN.UTF-8"       # Thiết lập ngôn ngữ là tiếng Việt
export LC_ALL="vi_VN.UTF-8"
export LC_CTYPE="vi_VN.UTF-8"
export LC_MESSAGES="vi_VN.UTF-8"
export LANGUAGE="vi_VN.UTF-8"
export LC_NUMERIC="vi_VN.UTF-8"     # Định dạng số
export LC_TIME="vi_VN.UTF-8"        # Định dạng thời gian
export LC_COLLATE="vi_VN.UTF-8"     # Cách sắp xếp chuỗi
export LC_MONETARY="vi_VN.UTF-8"     # Định dạng tiền tệ
export CAUHINH="/mnt/e/config/cauhinh"
export XDG_RUNTIME_DIR="/tmp/runtime-root"
#export install_path="$HOME/.config"
# Các biến môi trường cho Zsh
#export ZDOTDIR="${ZDOTDIR:-$HOME/.config}"
export ZSH_CUSTOM=$HOME/.config/custom
#export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Đặt biến cho đường dẫn đến tệp cấu hình Powerlevel10k
export P10K_CONFIG_PATH="/mnt/e/config/cauhinh/.p10k.zsh"
#typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl'
# Nạp cấu hình Powerlevel10k
source ~/.config/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
if [[ -f "$P10K_CONFIG_PATH" ]]; then
    source "$P10K_CONFIG_PATH"
fi

# 2. Cài đặt các alias từ tệp aliases.zsh
# ---------------------------------------
alias saoluu="chmod +x /mnt/e/config/kali/kali.sh && /mnt/e/config/kali/kali.sh backup"
alias khoiphuc="chmod +x /mnt/e/config/kali/kali.sh && /mnt/e/config/kali/kali.sh restore"
alias l="eza -gh --group-directories-first --git --icons=auto --hyperlink -G -a"
ALIAS_FILE="$CAUHINH/aliases.zsh"
if [ -f "$ALIAS_FILE" ]; then
     source "$ALIAS_FILE"
fi

#--------------------[ HISTORY ]-------------------------------------#

HISTFILE=$CAUHINH/history.zsh
HISTSIZE=99999       		# Số lượng lệnh được lưu trong bộ nhớ
SAVEHIST=99999      		# Số lượng lệnh được lưu vào file
setopt appendhistory 		# Lưu lịch sử vào file, không ghi đè
setopt histignoredups 		# Bỏ qua các lệnh trùng nhau
setopt sharehistory  		# Chia sẻ lịch sử giữa các phiên Zsh
setopt incappendhistory   	# Lịch sử lưu ngay khi nhập lệnh
setopt extended_history   	# Lịch sử với timestamp
setopt auto_cd            	# Tự động chuyển thư mục khi nhập tên thư mục
setopt histverify         	# Xác nhận lệnh trước khi thực thi
setopt no_beep           	# Tắt âm thanh beep
setopt prompt_subst       	# Cho phép thay thế trong prompt

# 6. Nạp cấu hình tùy chỉnh
# --------------------------
for config_file in "$ZSH_CUSTOM"/*.zsh; do
    [[ -f "$config_file" ]] && source "$config_file"
done

# 7. Cấu hình màu sắc
# ----------------------
autoload -U colors && colors
PS1="%{$fg[cyan]%}%n@%m %{$fg[green]%}%1~ %{$reset_color%}$"  # Thiết lập màu sắc cho prompt

# 8. Cấu hình tùy chỉnh
#-----------------------------
source ~/.config/addon/opt.zsh
source $ZSH_CUSTOM/plugins/fzf-tab/fzf-tab.plugin.zsh
source $CAUHINH/taoalias.zsh
source $CAUHINH/taoplugin.zsh
source $CAUHINH/select_all.zsh
#source $CAUHINH/zstyle.zsh
source $CAUHINH/namesever.zsh
#source $CAUHINH/key.zsh
#. $ZSH_CUSTOM/alias_zstyle.zsh
#source $CAUHINH/zinit_custom.zsh
FZF_TAB_ALWAYS_COMPLETE=1

#--------------------------------------------
# Đặt đường dẫn cho file .zcompdump ở một thư mục khác
ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.cache/zsh/.zcompdump"

# Tự động tạo lại tệp .zcompdump nếu cần thiết
if [[ ! -f $ZSH_COMPDUMP ]]; then
    compinit
    compdump -d "$ZSH_COMPDUMP"
fi

if [[ -z "$ZSH_COMPDUMP_LOADED" ]]; then
    # Kiểm tra và nạp compdump nếu chưa có
    autoload -Uz compinit
    compinit

    # Đặt biến ZSH_COMPDUMP_LOADED để ghi nhớ rằng compdump đã được nạp
    export ZSH_COMPDUMP_LOADED=1
fi



#zstyle ':fzf-tab:*' list-colors ''
#zstyle ':completion:*' list-colors ''

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
enable-fzf-tab
