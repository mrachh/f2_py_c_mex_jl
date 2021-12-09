      subroutine all_add(a,b,c,m,iavec,ibvec,icvec,n,zamat,zbmat,zcmat)
c
cf2py intent(in) m,n,a,b,iavec,ibvec,zamat,zbmat
cf2py intent(out) icvec,zcmat
c
c   This subroutine is adds two real numbers, two integer arrays
c   and two complex matrices
c
c   Input arguments:
c     - a: real *8
c         first real number
c     - b: real *8
c         second real number
c     - m: integer
c         length of integer array, and leading dimension of complex
c         matrices
c     - iavec: integer(m)
c         first integer array
c     - ibvec: integer(m)
c         second integer array
c     - n: integer
c         number of columns in the complex matrices
c     - zamat: complex *16(m,n)
c         first complex matrix
c     - zbmat: complex *16
c
c

      implicit real *8 (a-h,o-z)
      integer, intent(in) :: m,n
      real *8, intent(in) :: a,b
      real *8, intent(out) :: c
      integer, intent(in) :: iavec(m),ibvec(m)
      integer, intent(out) :: icvec(m)
      
      complex *16, intent(in) :: zamat(m,n),zbmat(m,n)
      complex *16, intent(out) :: zcmat(m,n)


      c = a+b
      
      do i=1,m
        icvec(i) = iavec(i)+ibvec(i)
      enddo

      do i=1,n
        do j=1,m
          zcmat(j,i) = zamat(j,i) + zbmat(j,i)     
        enddo
      enddo





      return
      end
