gtk3_dir = join_paths(starter_dir_dark, 'gtk-3.0')

# theme sources .scss files

# The files that need to be compiled
gtk3_scss_sources = [
  'gtk-dark'
]

# Dependencies of the files that need to be compiled
gtk3_scss_dependencies = [
  '_colors-public.scss',
  '_tweaks.scss',
  '_colors.scss',
  '_common.scss',
  '_apps.scss',
  '_budgie-desktop.scss',
  '_libhandy.scss',
  '_drawing.scss',
]

# Generate .css files and install
gtk3_scss_dependencies = files(gtk3_scss_dependencies)
#
foreach f : gtk3_scss_sources
    custom_target('generate_dark' + f,
        input: f + '.scss',
        output: 'gtk' + '.css',
        depend_files: gtk3_scss_dependencies,
        command: [sassc, '-a', '@INPUT@', '@OUTPUT@'],
        build_by_default: true,
        install: true,
        install_dir: gtk3_dir,
    )
endforeach

# Install assets
install_subdir('assets', install_dir: gtk3_dir, strip_directory: false)
