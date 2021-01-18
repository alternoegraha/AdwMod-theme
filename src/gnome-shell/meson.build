# detect gnome-shell version
gnome_shell = find_program('gnome-shell', required: false)

if get_option('gnome_shell_version') != ''
  gnome_shell_version = get_option('gnome_shell_version')
else
  if gnome_shell.found()
    gnome_shell_version_array = run_command([gnome_shell, '--version']).stdout().split('\n')[0].split(' ')[-1].strip().split('.')

    if gnome_shell_version_array[1].to_int().is_even()
      gnome_shell_version = '.'.join([gnome_shell_version_array[0], gnome_shell_version_array[1]])
    else
      gnome_shell_version = '.'.join([gnome_shell_version_array[0], (gnome_shell_version_array[1].to_int() + 1).to_string()])
    endif
  else
    message('gnome-shell not found, using styles for last gnome-shell version availible')
    gnome_shell_version = '3.36'
  endif
endif

# theme sources .scss files
theme_sources = [
  'gnome-shell-sass/_colors.scss',
  'gnome-shell-sass/_common.scss',
  'gnome-shell-sass/_extensions.scss',
  'gnome-shell-sass/_drawing.scss',
  'gnome-shell-sass/_widgets.scss',
  # also 'track/watch' widgets scss changes
  'gnome-shell-sass/widgets/_a11y.scss',
  'gnome-shell-sass/widgets/_app-grid.scss',
  'gnome-shell-sass/widgets/_base.scss',
  'gnome-shell-sass/widgets/_buttons.scss',
  'gnome-shell-sass/widgets/_calendar.scss',
  'gnome-shell-sass/widgets/_check-box.scss',
  'gnome-shell-sass/widgets/_corner-ripple.scss',
  'gnome-shell-sass/widgets/_dash.scss',
  'gnome-shell-sass/widgets/_dialogs.scss',
  'gnome-shell-sass/widgets/_entries.scss',
  'gnome-shell-sass/widgets/_hotplug.scss',
  'gnome-shell-sass/widgets/_ibus-popup.scss',
  'gnome-shell-sass/widgets/_keyboard.scss',
  'gnome-shell-sass/widgets/_login-dialog.scss',
  'gnome-shell-sass/widgets/_looking-glass.scss',
  'gnome-shell-sass/widgets/_message-list.scss',
  'gnome-shell-sass/widgets/_misc.scss',
  'gnome-shell-sass/widgets/_network-dialog.scss',
  'gnome-shell-sass/widgets/_notifications.scss',
  'gnome-shell-sass/widgets/_osd.scss',
  'gnome-shell-sass/widgets/_overview.scss',
  'gnome-shell-sass/widgets/_panel.scss',
  'gnome-shell-sass/widgets/_popovers.scss',
  'gnome-shell-sass/widgets/_screen-shield.scss',
  'gnome-shell-sass/widgets/_scrollbars.scss',
  'gnome-shell-sass/widgets/_search-entry.scss',
  'gnome-shell-sass/widgets/_search-results.scss',
  'gnome-shell-sass/widgets/_slider.scss',
  'gnome-shell-sass/widgets/_switcher-popup.scss',
  'gnome-shell-sass/widgets/_switches.scss',
  'gnome-shell-sass/widgets/_tiled-previews.scss',
  'gnome-shell-sass/widgets/_window-picker.scss',
  'gnome-shell-sass/widgets/_workspace-switcher.scss',
  'gnome-shell-sass/widgets/_workspace-thumbnails.scss',
]

foreach theme: themes
  gnome_shell_dir = join_paths(theme['dir'], 'gnome-shell')

  install_data(
    [
      'pad-osd.css',
    ],
    install_dir: gnome_shell_dir,
  )

  #
  # SCSS
  #

  gnome_shell_scss_conf = configuration_data()
  gnome_shell_scss_conf.set('variant', theme['scss_variant'])
  gnome_shell_scss_conf.set('version', gnome_shell_version)

  # Configure SCSS file
  gnome_shell_scss = configure_file(
    input: 'gnome-shell.scss.in',
    output: 'gnome-shell.@0@.scss'.format(theme['name']),
    configuration: gnome_shell_scss_conf,
  )

  # Copy it from build dir to source dir
  run_command(
    'cp',
    gnome_shell_scss,
    meson.current_source_dir(),
  )

  # Generate CSS file
  gnome_shell_css = custom_target(
    'gnome-shell.@0@.css'.format(theme['name']),
    input: 'gnome-shell.@0@.scss'.format(theme['name']),
    output: 'gnome-shell.@0@.css'.format(theme['name']),
    command: [sassc, sassc_opts, '@INPUT@', '@OUTPUT@'],
    depend_files: theme_sources,
    build_by_default: true,
  )

  # Install it while renaming to a valid name
  meson.add_install_script(
    'sh', '-c', 'cp "@0@" "@1@"'.format(
      gnome_shell_css.full_path(),
      join_paths('$MESON_INSTALL_DESTDIR_PREFIX', gnome_shell_dir, 'gnome-shell.css'),
    ),
  )
endforeach