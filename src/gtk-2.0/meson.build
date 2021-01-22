foreach theme: themes
  gtk2_dir = join_paths(theme['dir'], 'gtk-2.0')

  if theme['color'] != '-dark'
    gtk2_assets_dir = 'assets'
  else
    gtk2_assets_dir = 'assets-dark'
  endif

  install_subdir(
    gtk2_assets_dir,
    strip_directory: true,
    install_dir: join_paths(gtk2_dir, 'assets'),
  )

  install_data(
    'gtkrc' + theme['color'],
    rename: 'gtkrc',
    install_dir: gtk2_dir,
  )

  if theme['color'] != '-dark'
    install_data(
    [
      'apps.rc',
      'main.rc',
      'hacks.rc',
    ],

      install_dir: gtk2_dir,
    )
  else
    install_data(
    [
      'apps.rc',
      'main.rc',
      'hacks.rc',
      'hacks-dark.rc',
    ],

      install_dir: gtk2_dir,
    )
  endif
endforeach