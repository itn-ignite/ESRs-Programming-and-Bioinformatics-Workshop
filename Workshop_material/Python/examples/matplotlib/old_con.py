#!/usr/bin/env python3

import matplotlib.pyplot as pyplot
import numpy as np

def f(x):
    return 8.0*x[0] + 12.0*x[1] + x[0]**2.0 - 2.0*x[1]**2.0

x = np.arange(-4,4,0.1)
y = np.arange(-4,4,0.1)
xx, yy = np.meshgrid(x,y,sparse=True)

z = f((xx, yy))

cs=pyplot.contour(x,y,z, 10,colors='k')
pyplot.clabel(cs, inline=True, fontsize=10)
pyplot.show()
