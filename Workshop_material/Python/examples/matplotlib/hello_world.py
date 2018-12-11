#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy

x = numpy.linspace(-1,1,100)
y = x**2

plt.plot(x, y, '+', c='r')
plt.xlim(-2,2)
plt.title('my first graph')
plt.xlabel('hello world')
plt.ylabel('goodbye world')
plt.show()
