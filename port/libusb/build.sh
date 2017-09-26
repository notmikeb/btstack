#!/bin/bash
ulimit -c unlimited
ulimit -c 

# force to rebuild library and pyx .so file
rm *.a
rm *.so
make all
python setup.py build_ext --inplace
python testbtif.py 
echo "use >gdb /usr/bin/python core"
echo "to debug coredump"
