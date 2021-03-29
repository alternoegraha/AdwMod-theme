gtk_versions = [
  '4.0',
]

# Dependencies of the files that need to be compiled
# note: 3rd-party apps and libhandy/libadwaita theming are not temporarily disabled
# until there's a Gtk4 apps available everywhere and libhandy4/libadwaita became stable
# budgie-desktop support also commented out because curretly it's not ported to Gtk4
gtk4_scss_dependencies = [
  '_colors-public.scss',
  '_tweaks.scss',
  '_colors.scss',
  '_common.scss',
#  '_apps.scss',
#  '_budgie-desktop.scss',
  '_libadwaita.scss',
  '_drawing.scss',
]

foreach theme: themes
  gtk_variants = [
    '',
  ]

  # Only non-dark themes need a dark variant.
  if theme['color'] != '-dark'
    gtk_variants += '-dark'
  endif

  gtk_scss_conf = configuration_data()
  gtk_scss_conf.set('variant', theme['scss_variant'])
  gtk_scss_conf.set('_sizevariant', theme['size_variant'])

  foreach gtk_version: gtk_versions
    gtk_version_dir = join_paths(theme['dir'], 'gtk-@0@'.format(gtk_version))

    install_subdir(
      'assets',
      install_dir: gtk_version_dir,
    )

    #
    # SCSS
    #

    foreach gtk_variant: gtk_variants
      gtk_temp_name = 'gtk@0@.gtk-@1@.@2@'.format(gtk_variant, gtk_version, theme['name'])

      # Configure SCSS file
      gtk_scss = configure_file(
        input: 'gtk@0@.scss.in'.format(gtk_variant),
        output: '@0@.scss'.format(gtk_temp_name),
        configuration: gtk_scss_conf,
      )

      # Copy it from build dir to source dir
      run_command(
        'cp',
        gtk_scss,
        meson.current_source_dir(),
      )

      # Generate CSS file
      gtk_css = custom_target(
        '@0@.css'.format(gtk_temp_name),
        input: '@0@.scss'.format(gtk_temp_name),
        output: '@0@.css'.format(gtk_temp_name),
        command: [sassc, sassc_opts, '@INPUT@', '@OUTPUT@'],
        depend_files: gtk4_scss_dependencies,
        build_by_default: true,
      )

      # Install it while renaming to a valid name
      meson.add_install_script(
        'sh', '-c', 'cp "@0@" "@1@"'.format(
          gtk_css.full_path(),
          join_paths('$MESON_INSTALL_DESTDIR_PREFIX', gtk_version_dir, 'gtk@0@.css'.format(gtk_variant)),
        ),
      )
    endforeach
  endforeach
endforeach
