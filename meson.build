# Project name, programming language and version
project (
    'textsnatcher',
    ['vala', 'c'],
    version: '2.0',
    meson_version: '>= 0.59.0'
)

# Import modules
i18n = import ('i18n')
gnome = import ('gnome')

# Constants
PROJECT_RDNN_NAME = 'com.github.rajsolai.textsnatcher'

# Project arguments
add_project_arguments (
    '-DGETTEXT_PACKAGE="@0@"'.format (PROJECT_RDNN_NAME),
    language: 'c'
)

# Listing dependencies
dependencies = [
    dependency('libadwaita-1'),
    dependency('granite-7'),
    dependency('gobject-2.0'),
    dependency('libportal', version: '>= 0.6'),
    dependency('gdk-pixbuf-2.0'),
    dependency('glib-2.0'),
    dependency('gtk4')
]

# Compile resources
as_resources = gnome.compile_resources (
    'as-resources', 'data/' + PROJECT_RDNN_NAME + '.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

subdir ('src')
subdir ('data')
subdir ('po')

meson.add_install_script ('meson/post_install.py')

# gnome.post_install(
#   glib_compile_schemas: true,
#   gtk_update_icon_cache: true,
#   update_desktop_database: true,
# )
