from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

setup(
  name = 'gap_if',
  ext_modules=cythonize([
    Extension("gap_if", ["gap_if.pyx"], libraries = ["gap_init", "usb-1.0"], library_dirs = ["."] ),
    ]),
)

