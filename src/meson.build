counter_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
]

counter_deps = [
  config_dep,
  dependency('gtk4'),
  dependency('libadwaita-1', version: '>= 1.4'),
]

counter_sources += gnome.compile_resources('counter-resources',
  'counter.gresource.xml',
  c_name: 'counter'
)

executable('counter', counter_sources,
  dependencies: counter_deps,
  include_directories: config_inc,
       install: true,
)
