<img src="data/logo.svg" alt="AdwMod" align="left" width="64" height="64"/>

AdwMod
=====
> This master branch are for GNOME 3.38. Using previous versions? there's a `gnome-3-34` and `gnome-3.36` branch

AdwMod (**Adw**aita **Mod**ified, formerly AdwaitaExtended) is a Adwaita (GNOME/GTK default theme) modified with some enhancements and additions.

### Features
- Uses compact variant by default `$sizevariant: compact;` (to make it better for low-resolution screens)
- **New!** Adaptive font size in GNOME shell.
- Consistent GTK2 theme (finally!)
- Xfce4 support (with xfwm4 theme included)
- Budgie Desktop support (Requires Budgie Desktop 10.5.1 or latest git version)
- MATE desktop support
> Although MATE is supported, currently there's no WM theme for Marco. I recommended to change default WM to metacity because it uses native GTK theming than legacy metacity-3 XML theming
- Modifications/tweaks are done in `_tweaks.scss` instead modifying `_common.scss` directly, to keep in sync with upstream changes

### Screenshots
![Light](/data/ss-light.png)
![Dark](/data/ss-dark.png)

### Installation
Clone this repo, and open directory with terminal and then:
```
meson build --prefix=/usr
sudo ninja -C build install
```
### Credits
- https://gitlab.gnome.org/GNOME/gtk (Adwaita GTK theme)
- https://gitlab.gnome.org/GNOME/gnome-themes-extra (Adwaita GTK 2 theme)
- https://gitlab.gnome.org/GNOME/gnome-shell (Adwaita shell theme)
- https://github.com/ubuntu/yaru (Upstream sync script)
- https://github.com/godlyranchdressing/gnome-theme-starter (Meson build template)
