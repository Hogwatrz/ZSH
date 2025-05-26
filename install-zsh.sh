sudo pacman -S zsh 
sudo pacman -S zsh-syntax-highlighting
sudo pacman -S zsh-autosuggestions
sudo pacman -S fzf
yay -S zsh-theme-powerlevel10k

git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
git clone https://github.com/Hogwatrz/ZSH/.zshrc ~/

chsh -s /bin/zsh
