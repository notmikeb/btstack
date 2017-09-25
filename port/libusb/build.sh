#!/bin/bash

make all
python setup.py build_ext --inplace
python testbtif.py 
