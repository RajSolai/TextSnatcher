[![Vala Programming language](https://img.shields.io/badge/Made%20With-Vala%20-A56DE2)](https://wiki.gnome.org/Projects/Vala)
![Flatpak Build workflow](https://github.com/RajSolai/TextSnatcher/actions/workflows/flatpak-build.yml/badge.svg)


<div align="center">
<img src="./data/icons/com.github.rajsolai.textsnatcher.svg" height="110px" />
<h1>TextSnatcher</h1>
<p>Copy Text from Images with ease, Perform OCR operations in seconds.</p>
<img alt="TextSnatcher OCR App for Linux" src="https://raw.githubusercontent.com/RajSolai/TextSnatcher/master/data/screenshots/snap-default.png"/>
</div>

## Download

<div align="center">
  <a href='https://flathub.org/apps/details/com.github.rajsolai.textsnatcher'><img width='240' alt='Download on Flathub' src='https://flathub.org/assets/badges/flathub-badge-i-en.png'/></a></br>
<a href="https://appcenter.elementary.io/com.github.rajsolai.textsnatcher"><img src="https://appcenter.elementary.io/badge.svg" alt="Get it on AppCenter"></a>
</div>

## Features
- Multiple Language Support.
- Copy Text from images with a Drag.
- Drag over any Image and Paste.
- Fast and Easy to Use.
- This application uses the Tesseract OCR 4.x for the character
recognition.
- Read more about [Tesseract](https://tesseract-ocr.github.io/tessdoc/Home.html) and Star ⭐️ [Tesseract-Project](https://github.com/tesseract-ocr/tesseract).

## Screencasts



https://user-images.githubusercontent.com/54436424/152921719-228485ba-0d37-4b01-864e-63a2792248b5.mp4



https://user-images.githubusercontent.com/54436424/152921736-c9567c9d-0afa-4c09-8706-6b2a1b6b635a.mp4



## Screenshots

![TextSnatcher OCR App for Linux](https://raw.githubusercontent.com/RajSolai/TextSnatcher/master/data/screenshots/snap-default.png)

![TextSnatcher OCR App for Linux](https://raw.githubusercontent.com/RajSolai/TextSnatcher/master/data/screenshots/snap-dark.png)

## Support Me

<a href="https://www.buymeacoffee.com/rajsolai" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="width: 200px;" ></a>

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/R6R7ABG0F)


## Social Media Posts

[LinkedIn Post on Why I created TextSnatcher](https://www.linkedin.com/posts/solai085_linux-commentbelow-apple-activity-6826408004519374848-wxsw)

## Dependencies

Ensure you have these dependencies installed

-   granite
-   gtk+-3.0
-   gobject-2.0
-   gdk-pixbuf-2.0
-   tesseract-ocr
-   tess-best trained data

## Install, build and run

```bash
# install elementary-sdk, meson and ninja
sudo apt install elementary-sdk meson ninja
# install tesseract ocr
sudo apt install tesseract-ocr
# installed needed tess-data from tessdata_best repo
https://github.com/tesseract-ocr/tessdata_best/archive/4.0.0.tar.gz
# clone repository
git clone https://github.com/RajSolai/TextSnatcher.git TextSnatcher
# cd to dir
cd TextSnatcher
# run meson
meson build --prefix=/usr
# cd to build, build and test
cd build
sudo ninja install && com.github.rajsolai.textsnatcher
```

## Build Flatpak locally

```bash
# install elementary-sdk and runtime for flatpak (version 6.0)
flatpak install io.elementary.Sdk
# clone the repository
git clone https://github.com/RajSolai/TextSnatcher.git TextSnatcher
# cd to dir
cd TextSnatcher
# run flatpak build script
sh fbuild.sh
```
## Inspirations

- ReadMe: https://github.com/alainm23/planner
- Application Structure: https://github.com/alcadica/develop
- TextSniper (MacOS Application)

Made with ❤️ for Linux
