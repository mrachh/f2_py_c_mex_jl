import numpy as np
import funcs1

m = 10
n = 17
a = 1.1
b = 2.1
iavec = np.random.randint(1,10,size=m)
ibvec = np.random.randint(1,10,size=m)
zamat = np.random.uniform(0,1,(m,n)) + 1j*np.random.uniform(0,1,(m,n))
zbmat = np.random.uniform(0,1,(m,n)) + 1j*np.random.uniform(0,1,(m,n))

zcmat_ex = zamat+zbmat
c_ex = a+b
icvec_ex = iavec + ibvec

c,icvec,zcmat = funcs1.all_add(a,b,iavec,ibvec,zamat,zbmat)

err1 = np.abs(c-c_ex)/np.abs(c_ex)
err2 = np.linalg.norm(icvec_ex-icvec)/np.linalg.norm(icvec_ex)
err3 = np.linalg.norm(zcmat_ex-zcmat)/np.linalg.norm(zcmat_ex)
print("error in real add: %5.3f\n"%err1)
print("error in integer array add: %5.3f\n"%err2)
print("error in complex matrix add: %5.3f\n"%err3)
