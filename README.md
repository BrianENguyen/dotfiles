# Dotfiles

Welcome to my dotfiles repo! Please keep in mind that I use these configs on BSPWM ArcoLinux. You will see other window manager configs on some of the files, but those are not used yet. Also, I do apologize for some files being messy as well. Feel free to take a look around, maybe use some of my configs, and have fun with them!

# Required Installations

- any type Nerd Font
- [picom-ibhagwan](https://github.com/ibhagwan/picom) - for rounded window corners and blurry terminal background
- [ueberzug](https://github.com/seebye/ueberzug) - displaying images in ranger terminal app
- zsh shell

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
