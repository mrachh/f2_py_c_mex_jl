#ifndef ALL_ADD_H
#define ALL_ADD_H

  #include<complex.h>

  typedef double complex CPX;
  #define rand01() ((double)rand()/RAND_MAX)
  void all_add_(double * a, double *b, double *c, int *m, int *iavec,
      int *ibvec, int *icvec, int *n, CPX *zamat, CPX *zbmat, CPX *zcmat);

#endif
