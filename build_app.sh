rm -rf build

meson --prefix=/tmp/TextSnatcher.app \
        --bindir=Contents/MacOS build

cd build

ninja install

echo "\n ✅ Build Completed, Check /tmp directory for .app file"