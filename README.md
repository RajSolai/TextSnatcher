# TextSnatcher

Snatch Text from Images at click. <br>
Drag over any text and Paste it ! <br>
This Minimal application uses the Tesseract OCR 5.x for the character recognition. Read more about [Tesseract](https://tesseract-ocr.github.io/tessdoc/Home.html) and Star ⭐️ [Tesseract-Project](https://github.com/tesseract-ocr/tesseract).

# Install it from source

You can of course download and install this app from source.

## Dependencies

Ensure you have these dependencies installed

-   granite
-   gtk+-3.0
-   switchboard-2.0
-   tesseract-ocr
-   scort

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
sudo ninja install && TextSnatcher
```
