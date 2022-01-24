# TextSnatcher

Snatch Text with a Drag. <br>
Drag over any Image and Paste ! <br>
This Minimal application uses the Tesseract OCR 4.x for the character
recognition. <br>
Read more about [Tesseract](https://tesseract-ocr.github.io/tessdoc/Home.html) and Star ⭐️ [Tesseract-Project](https://github.com/tesseract-ocr/tesseract).

## Support Me

<a href="https://www.buymeacoffee.com/rajsolai" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="width: 200px;" ></a>

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
# clone repository
git clone {{repository_url}} TextSnatcher
# cd to dir
cd TextSnatcher
# run meson
meson build --prefix=/usr
# cd to build, build and test
cd build
sudo ninja install && com.github.rajsolai.textsnatcher
```
