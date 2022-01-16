# Project name, programming language and version
project (
    'com.github.rajsolai.TextSnatcher',
    'vala', 'c',
    version: '0.0.1'
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
    dependency('gdk-pixbuf-2.0'),
    dependency ('glib-2.0'),
    dependency ('gtk+-3.0')
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
    meson.project_name (),
    sources,
    as_resources,
    dependencies: dependencies,
    install: true
)

subdir ('data')
subdir ('po')

meson.add_install_script ('meson/post_install.py')
