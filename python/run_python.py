#use f2py to build python interface
python -m numpy.f2py --overwrite-signature ../fortran/funcs1.f -m funcs1 -h funcs1.pyf
python -m numpy.f2py -c funcs1.pyf ../fortran/funcs1.f
