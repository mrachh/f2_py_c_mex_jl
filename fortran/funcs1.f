      subroutine all_add(a,b,c,m,iavec,ibvec,icvec,n,zamat,zbmat,zcmat)
      implicit real *8 (a-h,o-z)
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
