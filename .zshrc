# ==========================
# Cấu hình Zsh của bạn - Gọn gàng và dễ quản lý
# ==========================

# 1. Thiết lập môi trường cơ bản
# ------------------------------
export TERM="xterm-256color"          # Hỗ trợ 256 màu cho terminal
export LANG="vi_VN.UTF-8"             # Ngôn ngữ là tiếng Việt
export LC_ALL="vi_VN.UTF-8"
export LC_CTYPE="vi_VN.UTF-8"
export LC_MESSAGES="vi_VN.UTF-8"
export LC_NUMERIC="vi_VN.UTF-8"       # Định dạng số
export LC_TIME="vi_VN.UTF-8"          # Định dạng thời gian
export LC_COLLATE="vi_VN.UTF-8"       # Sắp xếp chuỗi
export LC_MONETARY="vi_VN.UTF-8"      # Định dạng tiền tệ

# Đặt đường dẫn tệp cấu hình tùy chỉnh
export CAUHINH="/mnt/e/config/cauhinh"
export ZDOTDIR="${ZDOTDIR:-$HOME/.config}"
export ZSH_CUSTOM="$HOME/.config/custom"

# Nạp cấu hình Powerlevel10k nếu tồn tại
P10K_CONFIG_PATH="/mnt/e/config/cauhinh/.p10k.zsh"
[[ -f "$P10K_CONFIG_PATH" ]] && source "$P10K_CONFIG_PATH"

# 2. Quản lý Zimfw
# --------------------
# Kiểm tra và tải zimfw nếu chưa có
ZIM_HOME="${ZDOTDIR:-$HOME}/.zim"
if [[ ! -e "${ZIM_HOME}/zimfw.zsh" ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o "${ZIM_HOME}/zimfw.zsh" \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p "${ZIM_HOME}" && wget -nv -O "${ZIM_HOME}/zimfw.zsh" \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi

# Nạp Zimfw và các module
source "${ZIM_HOME}/zimfw.zsh" init -q
source "${ZIM_HOME}/init.zsh"

# 3. Lịch sử lệnh
# --------------------
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt histignoredups
setopt sharehistory
setopt incappendhistory   # Lịch sử lưu ngay khi nhập lệnh
setopt extended_history   # Lịch sử với timestamp

# 4. Cài đặt các alias từ tệp aliases.zsh
# ---------------------------------------
alias saoluu="chmod +x /mnt/e/config/kali/kali.sh && /mnt/e/config/kali/kali.sh backup"
alias khoiphuc="chmod +x /mnt/e/config/kali/kali.sh && /mnt/e/config/kali/kali.sh restore"
[[ -f "$CAUHINH/aliases.zsh" ]] && source "$CAUHINH/aliases.zsh"

# 5. Tùy chọn Zsh hữu ích
# -----------------------
setopt auto_cd            # Tự động chuyển thư mục khi nhập tên thư mục
setopt histverify         # Xác nhận lệnh trước khi thực thi
setopt no_beep            # Tắt âm thanh beep
setopt prompt_subst       # Cho phép thay thế trong prompt

# 6. Tích hợp Zinit
# -----------------
#ZPFX="$HOME/.config/zinit"
#ZINIT_HOME="$ZPFX/zinit.git"

# Kiểm tra và cài đặt Zinit nếu chưa có
#if [[ ! -d "$ZINIT_HOME" ]]; then
#    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
#fi

# Nạp Zinit và các plugin
#source "$ZINIT_HOME/zinit.zsh"
#zinit light zsh-users/zsh-autosuggestions
#zinit light zsh-users/zsh-syntax-highlighting
#zinit light zsh-users/zsh-completions
#zinit light romkatv/powerlevel10k

# 7. Thiết lập bổ sung
# --------------------
# Nạp các plugin tùy chỉnh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Kiểm tra và nạp tệp cấu hình từ thư mục custom nếu tồn tại
if [[ -d "$ZSH_CUSTOM" ]]; then
    for config_file in "$ZSH_CUSTOM"/*.zsh; do
        [[ -f "$config_file" ]] && source "$config_file"
    done
fi
source ~/.config/zstyle.zsh
zstyle ':zim:git-info' ignore-submodules 'none'
zstyle ':zim:git-info' verbose yes
zstyle ':zim:git-info:branch' format 'branch:%b'
zstyle ':zim:git-info:commit' format 'commit:%c'
zstyle ':zim:git-info:remote' format 'remote:%R'
zstyle ':zim:git-info:keys' format \
    'prompt'  'git(%b%c)' \
    'rprompt' '[%R]'
autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info

PS1='${(e)git_info[prompt]}%# '
RPS1='${(e)git_info[rprompt]}'

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh
eval "$(starship init zsh)"
skip_global_compinit=1

