# Install main translations
i18n.gettext (meson.project_name (),
    args: [
        '--directory=' + meson.current_source_dir(),
        '--from-code=UTF-8'
    ],
    preset: 'glib'
)

subdir ('extra')
