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
  use diagon_mod
  use rank_mod
    implicit none                                                   ! project.irp.f:   2
  character*(7) :: irp_here = 'project'                             ! project.irp.f:   1
    integer :: i,j,k,l,m,temp                                       ! project.irp.f:   4
    integer,allocatable :: maxj(:)                                  ! project.irp.f:   5
    real*8 :: maxe                                                  ! project.irp.f:   7
  if (.not.c_is_built) then
    call provide_c
  endif
  if (.not.rank_is_built) then
    call provide_rank
  endif
  if (.not.ddd_is_built) then
    call provide_ddd
  endif
    write(6,*)'projected on'                                        ! project.irp.f:  67
    do i=1,rank                                                     ! project.irp.f:  68
        do j=1,rank                                                 ! project.irp.f:  69
            write(6,12) (DDD(j,i))                                  ! project.irp.f:  70
        enddo                                                       ! project.irp.f:  71
        write(6,*)                                                  ! project.irp.f:  72
    enddo                                                           ! project.irp.f:  73
    write(6,*)'<p|E|p>'                                             ! project.irp.f:  75
        DD=0d0                                                      ! project.irp.f:  76
        do i=1,rank                                                 ! project.irp.f:  77
         do j=1,rank                                                ! project.irp.f:  78
          do m=1,rank                                               ! project.irp.f:  79
           DD(i,j)= DD(i,j)+DDD(i,m)*E(m)*DDD(j,m)                  ! project.irp.f:  80
          enddo                                                     ! project.irp.f:  81
         enddo                                                      ! project.irp.f:  82
        enddo                                                       ! project.irp.f:  83
    write(6,*)'projected on2'                                       ! project.irp.f:  85
    do i=1,rank                                                     ! project.irp.f:  86
        do j=1,rank                                                 ! project.irp.f:  87
            write(6,12) (DD(j,i))                                   ! project.irp.f:  88
        enddo                                                       ! project.irp.f:  89
        write(6,*)                                                  ! project.irp.f:  90
    enddo                                                           ! project.irp.f:  91
   12   format((F8.2,' '),$)                                        ! project.irp.f:  93
contains                                                            ! project.irp.f:  94
end                                                                 ! project.irp.f:  96
