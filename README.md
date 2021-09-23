# my dotfiles, chezmoi-style.

If the configuration isn't in here, I don't care about the app anyway.

## Installation

There are a few prerequisites that are needed for Arch Linux:

### Paru

```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

### 1Password GUI

```bash
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
git clone https://aur.archlinux.org/1password.git
cd 1password
 makepkg -si
```

### Install dotfiles and bootstrap system

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/tbjers/dotfiles/HEAD/install.sh)"
```
