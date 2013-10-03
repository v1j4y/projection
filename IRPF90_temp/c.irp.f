
BEGIN_PROVIDER [real*8, C,(rank,rank)]
&BEGIN_PROVIDER [real*8, DD,(rank,rank)]
&BEGIN_PROVIDER [real*8, EI,(rank,rank)]
&BEGIN_PROVIDER [real*8, e,(rank)]

    implicit none
    ! BEGIN_DOC
    ! coefficient matrix
    ! END_DOC

    integer :: i,j,k,l
    real*8 e0

    c(1,1) = 0
    c(1,2) = 0
    c(1,3) = 3
!   c(1,4) = 0

    c(2,1) = 0
    c(2,2) = 0
    c(2,3) = 1
!   c(2,4) = 1

    c(3,1) = 3
    c(3,2) = 1
    c(3,3) = 1
!   c(3,4) = 1

!   c(4,1) = 0
!   c(4,2) = 1
!   c(4,3) = 1
!   c(4,4) = 1


!   print coefficient matrix

    write(6,*)'coefficient matrix C'
    do i=1,rank
        do j=1,rank
            write(6,12)c(j,i)
        enddo
            write(6,*)
    enddo


!       e0 =   -1.176523105361*27.211
!       e0 =   0d0
!       e(1) =   -2.2019-e0
!       e(2) =    0.0888-e0
!       e(3) =    5.1131-e0
!       e(4) =   -1.096479*27.211-e0
!       e(5) =   -1.088777*27.211-e0
!       e(6) =   -1.076151*27.211-e0
!       e(7) =   -1.044529*27.211-e0
!       e(8) =   -1.002681*27.211-e0
!       e(9) =   -0.984576*27.211-e0
!       e(10) =   -0.92721*27.211-e0
!       e(11) =   -1.17110*27.211-e0
!       e(12) =   -1.15177*27.211-e0
!       e(13) =   -1.10313*27.211-e0
!       e(14) =   -1.08116*27.211-e0
!       e(15) =   -1.06633*27.211-e0
!       e(16) =   -1.05876*27.211-e0
!       e(17) =   -1.04113*27.211-e0
!       e(18) =   -1.02013*27.211-e0
!       e(19) =   -0.99786*27.211-e0
!       e(20) =   -0.90786*27.211-e0

!   calculate EI

!   do i=1,rank
!       do j=1,rank
!           if(j.eq.i)then
!           EI(j,i)=E(i)
!           else
!           EI(j,i)=0d0
!           endif
!       enddo
!   enddo


   12   format((F5.2,'  '),$)
END_PROVIDER
