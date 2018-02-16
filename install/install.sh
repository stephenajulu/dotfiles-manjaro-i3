#!/usr/bin/env bash

echo "install software"
sh ~/dotfiles-manjaro-i3/install/software.sh

echo "git config"

if [ -f ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.gitconfig-pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.gitconfig ~/.gitconfig

echo "zshrc"

if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc-pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.zshrc ~/.zshrc
sudo ln -fs /home/jim/dotfiles-manjaro-i3/config/.zshrc /root/.zshrc

echo "motd"

if [ -d ~/.motd.d ]; then
  if [ ! -L ~/.motd.d ]; then
    mv ~/.motd.d ~/.motd.d-pre-dotfiles-bak
  else
    rm ~/.motd.d
  fi
fi
ln -fs ~/dotfiles-manjaro-i3/config/.motd.d ~/

echo "file templates"

sh ~/dotfiles-manjaro-i3/install/templates.sh

echo "terminator"

if [ ! -d ~/.config/terminator ]; then
  mkdir ~/.config/terminator
fi
if [ -f ~/.config/terminator/config ]; then
  mv ~/.config/terminator/config ~/.config/terminator/config.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.terminator ~/.config/terminator/config

echo "rofi"

if [ ! -d ~/.config/rofi ]; then
  mkdir ~/.config/rofi
fi
if [ -d ~/.config/rofi/themes ]; then
  mv ~/.config/rofi/themes ~/.config/rofi/themes.pre-dotfiles-bak
fi
if [ -f ~/.config/rofi/config ]; then
  mv ~/.config/rofi/config ~/.config/rofi/config.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/rofi/config ~/.config/rofi/config
ln -fs ~/dotfiles-manjaro-i3/config/rofi/themes ~/.config/rofi/themes

echo "i3"

if [ ! -d ~/.i3 ]; then
  mkdir ~/.i3
fi
if [ -f ~/.i3/config ]; then
  mv ~/.i3/config ~/.i3/config.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/i3/config ~/.i3/config

if [ -f ~/.config/i3/i3blocks.conf ]; then
  mv ~/.config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/i3/i3blocks.conf ~/.config/i3

if [ -f ~/.i3status.conf ]; then
  mv ~/.i3status.conf ~/.i3status.conf.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/i3/i3status.conf ~/.i3status.conf

if [ ! -f ~/lock-i3.sh ]; then
  ln -fs ~/dotfiles-manjaro-i3/scripts/lock-i3.sh ~/lock-i3.sh
fi

echo "gtk"

if [ -f ~/.gtkrc-2.0.mine ]; then
  mv ~/.gtkrc-2.0.mine ~/.gtkrc-2.0.mine.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.gtkrc-2.0.mine ~/.gtkrc-2.0.mine

if [ -f ~/.config/gtk-3.0/settings.ini ]; then
  mv ~/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/gtk-3.0/settings.ini ~/.config/gtk-3.0/

echo "screen layouts"

if [ -d ~/.screenlayout ]; then
  mv ~/.screenlayout ~/.screenlayout.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/screenlayout ~/.screenlayout

echo "compton"

if [ -f ~/.compton.conf ]; then
  mv ~/.compton.conf ~/.compton.conf.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.compton.conf ~/.compton.conf

echo "X settings"

if [ -f ~/.Xresources ]; then
  mv ~/.Xresources ~/.Xresources.pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/.Xresources ~/.Xresources

echo "MIME apps"

if [ -f ~/.config/mimeapps.list ]; then
  mv ~/.config/mimeapps.list ~/.config/mimeapps.list-pre-dotfiles-bak
fi
ln -fs ~/dotfiles-manjaro-i3/config/mimeapps.list ~/.config/mimeapps.list

echo "pavucontrol"
sudo pacman -S --noconfirm pavucontrol

echo "playerctl"
sudo pacman -S --noconfirm playerctl

echo "postgres"
sudo pacman -S --noconfirm postgresql

echo "changing default shell to zsh"
sudo chsh -s /usr/bin/zsh
sudo chsh -s /usr/bin/zsh jim

echo "setting up trackpad"
sh ~/dotfiles-manjaro-i3/scripts/trackpad-setup.sh

echo "removing palemoon"
sudo pacman -Rs palemoon-bin

echo "DONE"

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "To finish postgres setup:"
echo "sudo -u postgres -i"
echo "initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'"
echo "exit"
echo "systemctl start postgresql.service"
echo "systemctl enable postgresql.service"
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"