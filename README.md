# Dotfiles

## Required Installations

- [pywal](https://github.com/dylanaraps/pywal) - a tool that generates a color palette from the dominant colors in an image
- zsh
- [picom-ibhagwan](https://github.com/ibhagwan/picom) - for rounded window corners and blurry terminal background

## ZSH Setup

### Packages
`yay -S zsh zsh-syntax-highlighting autojump zsh-autosuggestions`

### Initial Install
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

## Wallpaper
Nord wallpaper color pallete generated using this website:

- https://ign.schrodinger-hat.it/

"Bubble Bay" wallpaper by [David Lanhan](https://dlanham.com/)
