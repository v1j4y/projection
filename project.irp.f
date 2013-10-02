program project
    implicit none

    integer :: i,j,k,l,m
    real*8,allocatable :: p(:,:)

    allocate (p(rank1,rank))

    p=0d0

    do i=1,rank
        do j=1,rank1
            do k=1,rank
                p(j,i)=p(j,i)+C(j,k)*DD(k,i)
            enddo
        enddo
    enddo

    do i=1,rank
        do j=1,rank
            write(6,12) (p(j,i))
        enddo
        write(6,*)
    enddo

   12   format((F8.2,' '),$)
contains
    !TODO
end program project
