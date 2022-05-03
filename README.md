# Dotfiles

## What are Dotfiles?

![img1](./screenshots/img1.png)  

Dotfiles are a way to customize your Linux / UNIX machine! This files are
located in the `/.config/` folder and they all start with a period (.) - hence,
*dotfiles*. This repository contains my personal dotfiles for you to analyze,
edit, or use.

## Info

| -                 | -                        |
|-------------------|--------------------------|
| WM                | bspwm                    |
| Terminal          | alacritty                |
| Shell             | ZSH                      |
| Compositor        | picom-jonaburg-git       |
| Bar               | polybar                  |
| Font              | JetBrains Mono Nerd Font |
| Color Scheme      | One Dark                 |
| App Launcher      | rofi                     |
| Keybinding Daemon | sxhkd                    |

## ZSH 

### Packages to Download

`yay -S zsh zsh-syntax-highlighting autojump zsh-autosuggestions`

### Setup

```
touch "$HOME/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
```

### Bash to ZSH

`chsh $USER`

then type

`/bin/zsh`


## Preview

![img1](./screenshots/img1.png)  

![img2](./screenshots/img2.png)  

![img3](./screenshots/img3.png)  