[![Vala Programming language](https://img.shields.io/badge/Made%20With-Vala%20-A56DE2)](https://wiki.gnome.org/Projects/Vala) 

<div align="center">
<img src="./data/icons/com.github.rajsolai.textsnatcher.svg" height="110px" />
<h1>TextSnatcher</h1>
<p>Copy Text from Images with ease, Perform OCR operations in seconds.</p>
<img alt="TextSnatcher OCR App for Linux" src="https://raw.githubusercontent.com/RajSolai/TextSnatcher/master/data/screenshots/snap-default.png"/>
</div>
<!-- 
## Download -->

## Features
- Multiple Language Support.
- Copy Text from images with a Drag.
- Drag over any Image and Paste.
- Fast and Easy to Use.
- This application uses the Tesseract OCR 4.x for the character
recognition.
- Read more about [Tesseract](https://tesseract-ocr.github.io/tessdoc/Home.html) and Star ⭐️ [Tesseract-Project](https://github.com/tesseract-ocr/tesseract).

## Screencasts

![TextSnatcher OCR App for Linux](https://raw.githubusercontent.com/RajSolai/TextSnatcher/master/vid.gif)

## Screenshots

![TextSnatcher OCR App for Linux](https://raw.githubusercontent.com/RajSolai/TextSnatcher/master/data/screenshots/snap-default.png)

![TextSnatcher OCR App for Linux](https://raw.githubusercontent.com/RajSolai/TextSnatcher/master/data/screenshots/snap-dark.png)

## Support Me

<a href="https://www.buymeacoffee.com/rajsolai" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="width: 200px;" ></a>

![Bitcoin Donations](https://img.shields.io/badge/BTC-bc1qeurehq632h3lweazzqxxxzzwqmxvuztj7r80ca-f2a900)


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

Made with ❤️ from India