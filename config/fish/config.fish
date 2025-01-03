starship init fish | source
set -x PATH "$HOME/.cargo/bin" $PATH
set -x EDITOR nvim
alias ls exa
alias ll "exa -l"
alias grep "grep --color=auto"
alias vim "nvim -c 'source $HOME/.config/nvim-min/init.vim' --clean"
