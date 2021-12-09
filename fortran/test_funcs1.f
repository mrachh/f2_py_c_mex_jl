      implicit real *8 (a-h,o-z)
      integer, allocatable :: iavec(:),ibvec(:),icvec(:),icvec_ex(:)
      complex *16, allocatable :: zamat(:,:),zbmat(:,:),zcmat(:,:)
      complex *16, allocatable :: zcmat_ex(:,:)
      complex *16 ima
      
      real *8 a,b,c,c_ex
      data ima/(0.0d0,1.0d0)/

      a = 1.1d0
      b = 2.3d0 
      c_ex= a+b

      m = 17
      allocate(iavec(m),ibvec(m),icvec(m),icvec_ex(m))

      do i=1,m
        iavec(i) = i*2
        ibvec(i) = i-3
        icvec_ex(i) = iavec(i) + ibvec(i)
      enddo


      n = 10
      allocate(zamat(m,n),zbmat(m,n),zcmat(m,n),zcmat_ex(m,n))

      do j=1,n
        do i=1,m
          zamat(i,j) = i+0.0d0 + ima*(j+0.0d0)
          zbmat(i,j) = j+0.0d0 + ima*(i+0.0d0)
          zcmat_ex(i,j) = zamat(i,j) + zbmat(i,j)
        enddo
      enddo

      call all_add(a,b,c,m,iavec,ibvec,icvec,n,zamat,zbmat,zcmat)
      
      err1 = abs(c_ex - c)/abs(c_ex)

      err2 = 0.0d0
      r2 = 0.0d0
      do i=1,m
        err2 = err2 + abs(icvec_ex(i)-icvec(i))**2
        r2 = r2 + abs(icvec_ex(i))**2
      enddo

      err2 = sqrt(err2/r2)

      err3 = 0.0d0
      r3 = 0.0d0
      do j=1,n
        do i=1,m
          err3 = err3 + abs(zcmat_ex(i,j) - zcmat(i,j))**2
          r3 = r3 + abs(zcmat_ex(i,j))**2
        enddo
      enddo
      err3 = sqrt(err3/r3)

      print *, "error in real add=",err1
      print *, "error in integer array add=",err2
      print *, "error in complex matrix add=",err3



      stop
      end
