#!/bin/python

import os
import sys
import tempfile
import time
from PIL import Image

intervals = 10
im1 = Image.open(sys.argv[1])
im2 = Image.open(sys.argv[2])
for alpha in range(0, intervals + 1):
    blend = Image.blend(im1, im2, alpha/intervals)
    blendF = tempfile.NamedTemporaryFile(suffix='.jpg')
    blend.save(blendF)
    os.system('feh --bg-fill ' + blendF.name)
