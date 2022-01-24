#!/usr/bin/env python3

from posixpath import dirname
from PIL import Image
import os


def rgb332(r, g, b):
    r = r >> 5
    g = g >> 5
    b = b >> 6
    c = r << 5 | g << 2 | b
    return [c]


def rgb565(r, g, b):
    r = r >> 3
    g = g >> 2
    b = b >> 3
    c = r << 11 | g << 5 | b
    return [c >> 8, c & 0xFF]


def convert(cvt, path, subpath):
    subpath = os.path.join(path, subpath)
    if not os.path.exists(subpath):
        os.mkdir(subpath)

    orig_subpath = subpath

    for _, _, filesnames in os.walk(path):
        for file in filesnames:
            if os.path.splitext(file)[-1] != ".bmp":
                continue
            im = Image.open(os.path.join(path, file))
            width, height = im.size
            data = im.getdata()
            try:
                if im.mode == "1":
                    subpath = os.path.join(f"{dirname(subpath)}", "1")
                    v = [[i] for (i) in data]
                else:
                    subpath = orig_subpath
                    v = [cvt(r, g, b) for (r, g, b) in data]
                b = bytearray()
                b.append(width & 0xFF)
                b.append(width >> 8)
                b.append(height & 0xFF)
                b.append(height >> 8)
                for pair in v:
                    for i in pair:
                        b.append(i)
                f = open(os.path.join(subpath, file), "wb")
                f.write(b)
                f.close()
                print(f"Generated {file} in {cvt.__name__}")
            except Exception as ex:
                print("An error occurred:", ex)
                pass
        break


def choose():
    option = int(input(
        "Enter (1) for 8-bit colour convert, Enter (2) for 16-bit colour convert\n"))
    if option == 1:
        pathname = "rgb332"
        return rgb332, pathname
    elif option == 2:
        pathname = "rgb565"
        return rgb565, pathname
    else:
        print("Invalid input!")
        return None, None


rgbtype, pathname = choose()
if rgbtype and pathname:
    convert(rgbtype, "bmp", pathname)
