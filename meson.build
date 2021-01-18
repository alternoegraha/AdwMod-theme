project(
  'adwmod',
  meson_version: '>= 0.47.0',
  default_options: ['prefix=/usr'],
)

theme_base_name = get_option('theme_name')
theme_base_dir = join_paths(get_option('datadir'), 'themes', theme_base_name)

sassc = find_program('sassc')
sassc_opts = ['-M', '-t', 'expanded']

themes = []
foreach color: get_option('colors')
  if color == 'default'
    color_suffix = ''
    scss_variant = 'light'
  elif color == 'dark'
    color_suffix = '-dark'
    scss_variant = 'dark'
  endif

  themes += {
    'name': theme_base_name + color_suffix,
    'dir': theme_base_dir + color_suffix,
    'color': color_suffix,
    'scss_variant': scss_variant,
  }
endforeach

foreach theme: themes
  install_data(
    'LICENSE',
    install_dir: theme['dir'],
  )
endforeach

if not get_option('flatpak')
  subdir('src')
else
  subdir('src/gtk')
endif
