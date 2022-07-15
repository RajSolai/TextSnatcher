# Project name, programming language and version
project (
    'com.github.rajsolai.textsnatcher',
    'vala', 'c',
    version: '1.0'
)

# Translation module
i18n = import ('i18n')
gnome = import ('gnome')

# Project arguments
add_project_arguments (
    '-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name ()),
    language: 'c'
)

# Listing dependencies
dependencies = [
    dependency('gobject-2.0'),
    dependency('libhandy-1'),
    dependency('gdk-pixbuf-2.0'),
    dependency('glib-2.0'),
    dependency('gtk+-3.0')
]

subdir ('src')

# for resources
as_resources = gnome.compile_resources (
    'as-resources', 'data/' + meson.project_name() + '.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)


# Executable
executable (
    'TextSnatcher',
    sources,
    as_resources,
    dependencies: dependencies,
    install: true
)

install_data('app.icns', install_dir : 'Contents/Resources')
install_data('Info.plist', install_dir : 'Contents')
install_data('TextSnatcher.sh', install_dir : 'Contents/MacOS')


subdir ('data')
subdir ('po')

meson.add_install_script ('meson/post_install.py')
