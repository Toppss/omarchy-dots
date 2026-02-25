if status is-interactive
# Commands to run in interactive sessions can go here
alias ff "fastfetch"
alias install "sudo pacman -S"
alias remove "sudo pacman -Rns"
alias update "sudo pacman -Syu"
zoxide init fish | source
end
