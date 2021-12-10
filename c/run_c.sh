gcc-11 -c -O3 -march=native -funroll-loops -std=c99 cprini.c -o cprini.o
gcc-11 -O3 -march=native -funroll-loops -std=c99 test1.c -o int2 cprini.o ../fortran/funcs1.o 
./int2
