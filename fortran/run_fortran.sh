# compile the fortran code
gfortran -c -O3 -march=native -std=legacy funcs1.f -o funcs1.o
# Link the fortran code
gfortran -O3 -march=native -std=legacy test_funcs1.f -o int2 funcs1.o 
# run the executable
./int2
