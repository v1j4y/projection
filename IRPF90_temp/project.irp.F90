! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

program irp_program                                                 ! project:   0
 call project                                                       ! project.irp.f:   0
 call irp_finalize_2027207563()                                     ! project.irp.f:   0
end program                                                         ! project.irp.f:   0
subroutine project                                                  ! project.irp.f:   1
  use c_mod
  use rank_mod
    implicit none                                                   ! project.irp.f:   2
  character*(7) :: irp_here = 'project'                             ! project.irp.f:   1
    integer :: i,j,k,l,m                                            ! project.irp.f:   4
    real*8,allocatable :: p(:,:)                                    ! project.irp.f:   5
  if (.not.c_is_built) then
    call provide_c
  endif
  if (.not.rank_is_built) then
    call provide_rank
  endif
    allocate (p(rank1,rank))                                        ! project.irp.f:   7
    p=0d0                                                           ! project.irp.f:   9
    do i=1,rank                                                     ! project.irp.f:  11
        do j=1,rank1                                                ! project.irp.f:  12
            do k=1,rank                                             ! project.irp.f:  13
                p(j,i)=p(j,i)+C(j,k)*DD(k,i)                        ! project.irp.f:  14
            enddo                                                   ! project.irp.f:  15
        enddo                                                       ! project.irp.f:  16
    enddo                                                           ! project.irp.f:  17
    do i=1,rank                                                     ! project.irp.f:  19
        do j=1,rank                                                 ! project.irp.f:  20
            write(6,12) (p(j,i))                                    ! project.irp.f:  21
        enddo                                                       ! project.irp.f:  22
        write(6,*)                                                  ! project.irp.f:  23
    enddo                                                           ! project.irp.f:  24
   12   format((F8.2,' '),$)                                        ! project.irp.f:  26
contains                                                            ! project.irp.f:  27
end                                                                 ! project.irp.f:  29
