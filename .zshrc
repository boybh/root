# 1. Thiết lập môi trường cơ bản
# ------------------------------
export LANG="vi_VN.UTF-8"       # Thiết lập ngôn ngữ là tiếng Việt
export LC_ALL="vi_VN.UTF-8"
export LC_CTYPE="vi_VN.UTF-8"
export LC_MESSAGES="vi_VN.UTF-8"
export LANGUAGE="vi_VN.UTF-8"
export LC_NUMERIC="vi_VN.UTF-8"     # Định dạng số
export LC_TIME="vi_VN.UTF-8"        # Định dạng thời gian
export LC_COLLATE="vi_VN.UTF-8"     # Cách sắp xếp chuỗi
export LC_MONETARY="vi_VN.UTF-8"     # Định dạng tiền tệ
export ZSH_CUSTOM="~/.config/custom"
export addon="~/.config/addon"

# Đường dẫn ZimFW
export ZIM_HOME="$HOME/.config/.zim"


# Tải ZimFW
if [ ! -f "$ZIM_HOME/init.zsh" ]; then
  echo "ZimFW chưa được cài đặt, hãy cài đặt bằng lệnh:"
  echo "export ZIM_HOME=\$HOME/.config/.zim && curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh"
else
  . $ZIM_HOME/init.zsh
fi

# Các tùy chọn Zsh
setopt promptsubst  # Cho phép thay thế biến trong prompt
setopt interactive_comments  # Cho phép thêm chú thích trong dòng lệnh

# Cài đặt theme (ví dụ robbyrussell)
#zmodule romkatv/powerlevel10k --use degit

# Plugin của ZimFW

# Alias và hàm tuỳ chỉnh
alias lss='ls -la'  # Liệt kê tệp tin chi tiết
alias gs='git status'  # Trạng thái Git
alias gc='git commit'  # Tạo commit Git
# Nạp alias từ file aliases.zsh
if [[ -f /mnt/e/config/cauhinh/aliases.zsh ]]; then
  source /mnt/e/config/cauhinh/aliases.zsh
fi


# Thiết lập prompt với Powerlevel10k
if [[ ! -d $ZIM_HOME/themes/powerlevel10k ]]; then
  git clone https://github.com/romkatv/powerlevel10k.git $ZIM_HOME/themes/powerlevel10k
fi
source $ZIM_HOME/themes/powerlevel10k/powerlevel10k.zsh-theme

# Cấu hình lưu history vào file history.zsh
export HISTFILE=/mnt/e/config/cauhinh/history.zsh
export HISTSIZE=10000        # Số lượng lệnh lưu trong lịch sử hiện tại
export SAVEHIST=10000        # Số lượng lệnh lưu trong file history
setopt APPEND_HISTORY        # Lưu lệnh mới vào cuối file history, không ghi đè
setopt SHARE_HISTORY         # Chia sẻ lịch sử giữa các phiên Zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"

source ~/.config/custom/plugins/fzf-tab/fzf-tab.plugin.zsh
. ~/.config/custom/select_all.zsh
typeset -g ZINIT_MOD_DEBUG=1
