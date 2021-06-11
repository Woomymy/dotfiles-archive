# Dotfiles-Portable

My dotfiles for Calculate GNU/Linux on my laptop

- [Softwares](#softwares)
- [Screenshots](#screenshots)
- [Notes about setup](#notes)

## Softwares

- [Rofi](./home/.config/rofi/config) Used as "applications" menu
- [I3-GAPS](./home/.config/i3/config) Window manager
- [Fish](./home/.config/fish/fish_variables) Shell
- [Neovim](./home/.config/nvim/init.vim) text editor
- [Picom](./home/.config/picom/picom.conf) Compositor
- [Alacritty](home/.config/alacritty/alacritty.yml) Terminal emulator
- [Dunst](home/.config/dunst/dunstrc) Notification daemon
- [Polybar](home/.config/polybar/launch.sh) status bar

## Screenshots

Screenshots can be found [here](./screenshots.md)

## Notes

### SSH configuration and ssh agent

The `~/.ssh/config` file is provided by theses dotfiles **but** it only contains options required to make ssh-agent work. If a `~/.ssh/private.config` is found, it will be included. You can change the name / path of this file by editing this line:
```ssh-config
Include private.config
```

SSH agent env can be found in `/tmp/SSH_ENV`. The /tmp/ directory must be cleared on every reboot

