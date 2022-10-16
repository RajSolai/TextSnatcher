# Install icons
icon_sizes = ['16', '24', '32', '48', '64', '128']

foreach i : icon_sizes
    install_data (
        join_paths ('icons', i, PROJECT_RDNN_NAME + '.svg'),
        install_dir: join_paths (get_option ('datadir'), 'icons', 'hicolor', i + 'x' + i, 'apps')
    )
    install_data (
        join_paths ('icons', i, PROJECT_RDNN_NAME + '.svg'),
        install_dir: join_paths (get_option ('datadir'), 'icons', 'hicolor', i + 'x' + i + '@2', 'apps')
    )
endforeach

# Translate and install our .desktop file so the Applications Menu will see it
i18n.merge_file (
    input: PROJECT_RDNN_NAME + '.desktop.in',
    output: PROJECT_RDNN_NAME + '.desktop',
    po_dir: join_paths (meson.current_source_dir(), 'po', 'extra'),
    type: 'desktop',
    install: true,
    install_dir: join_paths (get_option ('datadir'), 'applications')
)

# Translate and install our .appdata.xml file so AppCenter will see it
i18n.merge_file (
    input: PROJECT_RDNN_NAME + '.appdata.xml.in',
    output: PROJECT_RDNN_NAME + '.appdata.xml',
    po_dir: join_paths (meson.current_source_dir(), 'po', 'extra'),
    install: true,
    install_dir: join_paths (get_option ('datadir'), 'metainfo')
)
