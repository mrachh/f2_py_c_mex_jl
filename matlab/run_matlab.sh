#Compile the .f file:
gfortran -c -O3 -march=native -std=legacy ../fortran/funcs1.f -o ../fortran/funcs1.o
#Generate the .m file from the .mw file
../../mwrap/mwrap -c99complex -list -mex funcsmw -mb mwfunc1.mw
#Generate a .c gateway
../../mwrap/mwrap -c99complex -mex funcsmw -c funcsmw.c mwfunc1.mw
#Generate mexmaci file to run on Mac
/Applications/MATLAB_R2021a.app/bin/mex -v funcsmw.c ../fortran/funcs1.o -largeArrayDims -DMWF77_UNDERSCORE1 -output funcsmw
