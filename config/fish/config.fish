if status is-interactive
    fish_add_path "$HOME/.cargo/bin"
    set -x EDITOR nvim
    alias ls eza
    alias ll "eza -l"
    alias la "eza -la"
    alias lg lazygit
    starship init fish | source
end
