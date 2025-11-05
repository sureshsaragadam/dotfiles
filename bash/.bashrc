# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export PATH="$HOME/.cargo/bin:$PATH"


alias vi=nvim
alias vim=nvim 


# ─── Show Git branch name in Bash prompt ──────────────
parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

# ─── Customize prompt with username, folder, and git branch ──────────────
export PS1="\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[0m\]\$ "

alias stowall='stow --restow --target=$HOME */'
