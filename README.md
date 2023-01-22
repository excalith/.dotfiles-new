

# Excalith Dotfiles
> ⚠️ This repository is work-in-progress!
>
> ⚠️ If you think you have no idea what you are doing with this setup, you should probably avoid using any dotfiles setup since they will override your own config files, which may cause issues on your end.
>
> ⚠️ Do not use any dotfiles from people you do not trust or check the scripts before using them. I would suggest checking out the code and find some beautiful approaches regarding .dotfiles managements and create your very own system.
 

## Installation
These dotfiles are intended for `MacOS 12.0 and above` and `Ubuntu 22.04 and above`

Depending on your OS, copy and paste the code to start installation. This code will download my dotfiles and start setup depending on your OS.

### MacOS
```bash
bash -c "$(curl -LsS https://raw.github.com/excalith/.dotfiles-new/main/scripts/setup.sh)"
```

### Ubuntu
```bash
bash -c "$(wget --no-cache -qO - https://raw.github.com/excalith/.dotfiles-new/main/scripts/setup.sh)"
```

## TO-DO
This repository is still work-in-progress, updating my old private .dotfiles setup to be more maintainable. For this reason, there are a lot of things to be done to complete it properly. 

### Ubuntu
- A wayland-compatible WM to act like yabai

### MacOS
- Need a MacOS VM to check this setup


## Credits
This dotfiles repository is a heavily ~~knocked-off~~ inspired version of beautiful [Cătălin’s dotfiles](https://github.com/alrra/dotfiles). You should probably check it out!

I have modified this dotfiles with my own taste of config files and added a bunch of helpers and utilities to install packages, extensions etc. from different sources that I trust. I tried to seperate installation system and OS-spesific configurations as much as I can, so it would be easier to implement new OS setups which I might do later.
