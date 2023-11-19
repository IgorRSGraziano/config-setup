sudo pacman -Syu
cd ~/Downloads
sudo pacman -S firefox --noconfirm

#Yay
sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm

#Fonts
sudo pacman -S ttf-jetbrains-mono-nerd ttf-fira-code --noconfirm

#Vscode
yay -S visual-studio-code-bin --noconfirm

#Terminal
sudo pacman -S zsh --noconfirm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Plugins terminal
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/' ~/.zshrc


#Nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc;
nvm install 21

#Bun
curl -fsSL https://bun.sh/install | bash

#GTK Dark mode
touch ~/.config/gtk-3.0/settings.ini
echo '[Settings]\ngtk-application-prefer-dark-theme=1' >> ~/.config/gtk-3.0/settings.ini

#Projects folder
mkdir ~/projects

#Generate SSH
ssh-keygen -t ed25519 -C "igorrsgrazianol@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

git config --global user.name "Igor Graziano"
git config --global user.email "igorrsgraziano@gmail.com"