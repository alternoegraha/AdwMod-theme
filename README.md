<img src=".data/logo.svg" alt="AdwMod" align="left" width="64" height="64"/>

AdwMod
=====
AdwMod (**Adw**aita **Mod**ified, formerly AdwaitaExtended) is a Adwaita (GNOME/GTK default theme) modified with some enhancements and additions.

### Features
- Uses compact variant by default `$sizevariant: compact;` (to make it better for low-resolution screens)
- Adaptive font size in GNOME shell.
- Consistent GTK2 theme (finally!)
- Modifications/tweaks are done in `_tweaks.scss` instead modifying `_common.scss` directly, to keep in sync with upstream changes (except in Gtk4)

### Supported desktop environments
- GNOME shell (3.36 and up)
- Budgie Desktop (10.5.x and up)
- Xfce (4.14 and up)
- MATE (partially supported)
#### Unsupported
- Qt-based desktops (Plasma, Deepin, LXQt, Lumina)
- LXDE
- Pantheon/elementary OS
> some elementary Apps uses custom stylesheet that requires elementary GTK theme

### Screenshots
![Light](/.data/ss-light.png)
![Dark](/.data/ss-dark.png)

### Installation
Clone this repo, and open directory with terminal and then:
```
# system-wide install
meson build
sudo ninja -C build install

# single user install 
meson build --prefix=$HOME/.local
ninja -C build install
```
### Credits
- https://gitlab.gnome.org/GNOME/gtk (Adwaita GTK theme)
- https://gitlab.gnome.org/GNOME/gnome-themes-extra (Adwaita GTK 2 theme)
- https://gitlab.gnome.org/GNOME/gnome-shell (Adwaita shell theme)
- https://github.com/ubuntu/yaru (Upstream sync script)
