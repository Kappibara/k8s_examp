#!/bin/bash

# Установка zsh и oh-my-zsh
sudo apt update
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt-get install -y kubectl

sudo snap install helm --classic

git clone https://github.com/ahmetb/kubectx.git ~/.kubectx
COMPDIR=$(pkg-config --variable=completionsdir zsh)
sudo ln -sf ~/.kubectx/completion/kubens.zsh $COMPDIR/_kubens
sudo ln -sf ~/.kubectx/completion/kubectx.zsh $COMPDIR/_kubectx
echo 'export PATH=$PATH:~/.kubectx' >> ~/.zshrc

# Установка k9s (через Snap, если Snap установлен)
if ! command -v snap &> /dev/null; then
  sudo apt-get install -y snapd
fi

sudo snap install k9s
sudo ln -s /snap/k9s/current/bin/k9s /snap/bin/

# Установка qemu-system
sudo apt-get install -y qemu-system

# Добавление автозаполнения для kubectl в zsh
echo 'source <(kubectl completion zsh)' >> ~/.zshrc

# Добавление алиасов для Docker
echo 'alias d="docker"' >> ~/.zshrc
echo 'alias dc="docker-compose"' >> ~/.zshrc

# Другие полезные алиасы Docker
echo 'alias dps="docker ps"' >> ~/.zshrc
echo 'alias dpsa="docker ps -a"' >> ~/.zshrc
echo 'alias di="docker images"' >> ~/.zshrc
echo 'alias drm="docker rm"' >> ~/.zshrc
echo 'alias drmf="docker rm -f"' >> ~/.zshrc
echo 'alias drmi="docker rmi"' >> ~/.zshrc
echo 'alias dlogs="docker logs"' >> ~/.zshrc


# Обновление источника
source ~/.zshrc

echo "Установка завершена!"
