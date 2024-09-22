#!/usr/bin/env zsh

# Function to generate random colored ASCII art
generate_random_ascii() {
  local text=$1
  local colors=(31 32 33 34 35 36)  # ANSI color codes for red, green, yellow, blue, magenta, cyan
  local random_color=${colors[$RANDOM % ${#colors[@]}]}  # Select a random color from the array
  echo -e "\e[${random_color}m$text\e[0m"
}

# Update and upgrade packages
pkg update && pkg upgrade -y

# Install necessary packages
pkg install -y wget git zsh curl

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Powerlevel10k theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Set Powerlevel10k as the theme in .zshrc
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Install zsh-syntax-highlighting plugin
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Install zsh-autosuggestions plugin
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Update plugins in .zshrc
sed -i 's/plugins=(.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

# Set history size in .zshrc
echo "HISTSIZE=5000" >> ~/.zshrc
echo "SAVEHIST=5000" >> ~/.zshrc

# Configure Hacker's Keyboard for Termux
mkdir -p ~/.termux
cat > ~/.termux/termux.properties <<EOL
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
EOL

# Add randomly colored ASCII art to .termux/termux.properties
generate_random_ascii "𝙏𝙊𝙥𝙋𝙇𝙐𝙂" >> ~/.termux/termux.properties

# Apply termux properties changes
termux-reload-settings

# Customize Powerlevel10k configuration (this section is customizable as per your preference)
cat >> ~/.zshrc <<EOL

# To customize prompt, run 'p10k configure' or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOL

# Add alias and useful functions (customize as needed)
cat >> ~/.zshrc <<'EOL'
alias ll='ls -la'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'

# Custom function to extract archives
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1    ;;
      *.tar.gz)    tar xzf $1    ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1     ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
EOL

# Apply changes
source ~/.zshrc

# Display completion message
echo "Setup complete! Please restart Termux for all changes to take effect. Enjoy your enhanced Termux experience!"
