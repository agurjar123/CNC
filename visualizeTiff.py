import numpy as np
import struct
from osgeo import gdal
from osgeo import ogr
from osgeo import osr
from osgeo import gdal_array
from osgeo.gdalconst import *
import matplotlib.pyplot as plt

cube = gdal.Open(filename)
bnd1 = cube.GetRasterBand(29)
bnd2 = cube.GetRasterBand(19)
bnd3 = cube.GetRasterBand(9)