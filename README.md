<img src=".data/logo.svg" alt="AdwMod" align="left" width="64" height="64"/>

AdwMod
=====
AdwMod (**Adw**aita **Mod**ified, formerly AdwaitaExtended) is a Adwaita (GNOME/GTK default theme) modified with some enhancements and additions.

## Features
- Available in **two variants.** 'Default' and 'Compact'
- Adaptive font size in GNOME shell.
- Consistent GTK2 theme (finally!)
- Modifications/tweaks are done in `_tweaks.scss` instead modifying `_common.scss` directly, to keep in sync with upstream changes (except in Gtk4)

## Supported desktop environments
- GNOME shell (3.36 and up)
- Budgie Desktop (10.5.x and up)
- Xfce (4.14 and up)
- MATE (partially supported)
> For MATE: Use `metacity` as default window manager. Currently there's no legacy metacity theme (used by Marco, Compiz and Cinnamon, `metacity-theme-3.xml`) available
### Unsupported
- Downstream-patched GNOME sessions
> use vanilla/stock GNOME session by installing `gnome-session`
- GNOME shell 3.34 and older
> this means distros that ships with old GNOME (e.g Ubuntu 18.04 or Debian stable) are unsupported
- Xfce 4.12 and older
> AdwMod doesn't have Xfce4 gtk2 theming and no plans to add it
- LXDE/Openbox
- Pantheon/elementary OS
> because apps designed for elementary OS uses custom stylesheet that requires elementary GTK theme to work

## Screenshots
![Light](/.data/light.png)
![Light-gtk4](/.data/light-gtk4.png)
![Dark](/.data/dark.png)
![Dark-gtk4](/.data/dark-gtk4.png)

## Installation
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
- https://gitlab.gnome.org/GNOME/gtk - Adwaita GTK theme
- https://gitlab.gnome.org/GNOME/gnome-themes-extra - Adwaita GTK2 theme
- https://gitlab.gnome.org/GNOME/gnome-shell - Adwaita shell theme
- https://github.com/ubuntu/yaru - upstream sync script
