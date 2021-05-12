gtk_versions = [
  '3.0',
]

# Dependencies of the files that need to be compiled
gtk3_scss_dependencies = [
  'widgets/_buttons.scss',
  'widgets/_calendar.scss',
  'widgets/_checks.scss',
  'widgets/_color-chooser.scss',
  'widgets/_dropdowns.scss',
  'widgets/_emoji-chooser.scss',
  'widgets/_entries.scss',
  'widgets/_expanders.scss',
  'widgets/_file-chooser.scss',
  'widgets/_header-bar.scss',
  'widgets/_labels.scss',
  'widgets/_level-bar.scss',
  'widgets/_links.scss',
  'widgets/_lists.scss',
  'widgets/_menus.scss',
  'widgets/_message-dialog.scss',
  'widgets/_misc.scss',
  'widgets/_notebook.scss',
  'widgets/_paned.scss',
  'widgets/_popovers.scss',
  'widgets/_progress-bar.scss',
  'widgets/_scale.scss',
  'widgets/_scrolling.scss',
  'widgets/_shortcuts-window.scss',
  'widgets/_sidebars.scss',
  'widgets/_spin-button.scss',
  'widgets/_spinner.scss',
  'widgets/_switch.scss',
  'widgets/_text-selection.scss',
  'widgets/_tabs.scss',
  'widgets/_toolbars.scss',
  'widgets/_tooltip.scss',
  'widgets/_trees.scss',
  'widgets/_views.scss',
  'widgets/_view-switcher.scss',
  'widgets/_window.scss',
  '_colors-public.scss',
  '_tweaks.scss',
  '_colors.scss',
  '_common.scss',
  '_apps.scss',
  '_budgie-desktop.scss',
  '_drawing.scss',
  '_widgets.scss',
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
        depend_files: gtk3_scss_dependencies,
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
