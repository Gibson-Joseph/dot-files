echo "🚀 Setting up your dev environment..."

#########################################################
# UPDATE SYSTEM
#########################################################
sudo apt update && sudo apt upgrade -y

#########################################################
# CORE PACKAGES
#########################################################
sudo apt install -y \
  git \
  curl \
  wget \
  unzip 

#########################################################
# CLI TOOLS
#########################################################
sudo apt install -y \
  eza \
  bat \
  fzf \
  fd-find \
  ripgrep \
  tmux

#########################################################
# SYSTEM UTILITIES
#########################################################
sudo apt install -y \
  bash-completion \
  libnotify-bin \
  locales
#########################################################
# INSTALL NVM (Node)
#########################################################
#
#
#
#########################################################
# INSTALL MINICONDA
#########################################################
#
#
#########################################################
# INSTALL NERD FONT (JetBrainsMono)
#########################################################
#
#
#
#########################################################
# INSTALL NEOVIM (Latest)
#########################################################
echo "📝 Installing Neovim..."
if ! command -v nvim &> /dev/null; then
  cd ~
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  chmod u+x nvim-linux-x86_64.appimage
  sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
fi


#########################################################
# INSTALL LAZYVIM
#########################################################
echo "⚡ Setting up LazyVim..."

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

#########################################################
# DONE
#########################################################
echo "✅ Setup complete! Restart your terminal."
