program project
    implicit none

    integer :: i,j,k,l,m,temp
    integer,allocatable :: maxj(:)
    real*8,allocatable :: p(:,:),max(:)
    real*8 :: maxe

    allocate (p(rank1,rank))
    allocate (maxj(rank))
    allocate (max(rank))

    p=0d0

    do i=1,rank
        do j=1,rank1
            do k=1,rank
                p(j,i)=p(j,i)+C(j,k)*DD(k,i)
            enddo
        enddo
    enddo

    write(6,*)'projected vectors'
    max=0d0
!   maxj=0
    do i=1,rank
        do j=1,rank1
            if(max(i).le.abs(p(j,i)))then
                max(i)=abs(p(j,i))
                maxj(i)=j
            endif
            write(6,12) (p(j,i))
        enddo
        write(6,*)
    enddo

    write(6,*)'maxs'
    do i=1,rank
        write(6,*)i,"-",maxj(i),max(i)
    enddo

    do i=1,rank
        maxj(i)=i
    enddo
    write(6,*)'max energy'
    maxe=-1d10
    do i=1,rank-1
    do j=i+1,rank
        if(e(j).lt.e(i))then
            maxe=e(j)
            e(j)=e(i)
            e(i)=maxe

            temp=maxj(j)
            maxj(j)=maxj(i)
            maxj(i)=temp
        endif
    enddo
    enddo
    do i=1,rank
        write(6,*)e(i),maxj(i)
    enddo

    write(6,*)'projected on'
    do i=1,rank
        do j=1,rank
            write(6,12) (DD(j,i))
        enddo
        write(6,*)
    enddo

   12   format((F8.2,' '),$)
contains
    !TODO
end program project
