<img src=".data/logo.svg" alt="AdwMod" align="left" width="64" height="64"/>

# AdwMod

AdwMod (**Adw**aita **Mod**ified, formerly AdwaitaExtended) is a Adwaita (GNOME/GTK default theme) modified with some enhancements and additions.

## Features
- Available in **two variants.** 'Default' and 'Compact'
- Adaptive font size in GNOME shell.
- Consistent GTK2 theme (finally!)

## Supported desktop environments
- GNOME shell (3.36 and up)
- Budgie Desktop (10.5.x and up)
- Xfce (4.14 and up)
- MATE (1.22 and up)

### Unsupported
- Downstream-patched GNOME sessions (only on Ubuntu and Pop!_OS)
> use vanilla/stock GNOME session by installing `gnome-session`
- GNOME shell < 3.34
- Xfce < 4.12
- LXDE/Openbox
- Pantheon/elementary OS
>	elementary OS platform apps only works with elementary stylesheet. It doesn't work properly with any 3rd-party themes including AdwMod

## Screenshots
![Light](/.data/light.png)
![Light-gtk4](/.data/light-gtk4.png)
![Dark](/.data/dark.png)
![Dark-gtk4](/.data/dark-gtk4.png)

## Recommendations
### Font
- Any `sans-serif` font
- font size: 11pt for **default** variant, 9/10pt for **compact** variant

## Installation
### Distro packages
**Arch Linux** users can install AdwMod theme via **AUR** *(thanks to yochananmarqos for submitting it on AUR)* :

`yay -S adwmod-theme-git`

### Manual Installation
Clone this repo, and open directory with terminal and then:
```
# system-wide install
-----
meson build
sudo ninja -C build install

# single user install 
-----
meson build --prefix=$HOME/.local
ninja -C build install
```
## Credits
- https://gitlab.gnome.org/GNOME/gtk - Adwaita GTK3 theme
- https://gitlab.gnome.org/GNOME/libadwaita - Adwaita GTK4 theme
- https://gitlab.gnome.org/GNOME/gnome-themes-extra - Adwaita GTK2 theme
- https://gitlab.gnome.org/GNOME/gnome-shell - Adwaita gnome-shell theme
- https://github.com/ubuntu/yaru - upstream sync script
- https://github.com/nana-4/materia-theme - meson.build files including gnome-shell version detect logic
