#include "stdlib.h"
#include "stdio.h"
#include "math.h"
#include "complex.h"
#include "all_add.h"
#include "cprini.h"

int main(int argc,char **argv)
{
  cprin_init("stdout", "fort.13");
  double a = 1.1;
  double b = 2.2;
  double c_ex = 3.3;
  double c = 0;
  int m = 10;
  int n = 17;

  int *iavec = (int *)malloc(m*sizeof(int));
  int *ibvec = (int *)malloc(m*sizeof(int));
  int *icvec = (int *)malloc(m*sizeof(int));
  int *icvec_ex = (int *)malloc(m*sizeof(int));

  CPX *zamat = (CPX *)malloc(m*n*sizeof(CPX));
  CPX *zbmat = (CPX *)malloc(m*n*sizeof(CPX));
  CPX *zcmat = (CPX *)malloc(m*n*sizeof(CPX));
  CPX *zcmat_ex = (CPX *)malloc(m*n*sizeof(CPX));

  for(int i=0; i<m;i++)
  {
     iavec[i] = 2*i;
     ibvec[i] = i-3;
     icvec_ex[i] = iavec[i] + ibvec[i];
  }

  for(int i=0; i<m*n; i++)
  {
     zamat[i] = rand01() + I*rand01();
     zbmat[i] = rand01() + I*rand01();
     zcmat_ex[i] = zamat[i] + zbmat[i];
  }

  double err1,err2,err3,r2,r3;
  all_add_(&a, &b, &c, &m, iavec,ibvec,icvec, &n, zamat,zbmat, zcmat);
  err1 = fabs(c-c_ex)/fabs(c_ex);
  
  r2 = 0;
  r3 = 0;
  err2 = 0;
  err3 = 0;
  for(int i=0; i<m;i++)
  {
    err2 = err2 + pow(fabs(icvec[i]-icvec_ex[i]),2);
    r2 = r2 + pow(fabs(icvec_ex[i]),2);
  }
  err2 = sqrt(err2/r2);

  for(int i=0; i<m*n;i++)
  {
    err3 = err3 + pow(fabs(zcmat[i]-zcmat_ex[i]),2);
    r3 = r3 + pow(fabs(zcmat_ex[i]),2);
  }
  err3 = sqrt(err3/r3);
  cprind("error in real add=",&err1,1);
  cprind("error in integer array add=",&err2,1);
  cprind("error in complex matrix add=",&err3,1);


  return 0;
}
