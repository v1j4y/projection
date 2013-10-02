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
    integer :: i,j,k,l,m,temp                                       ! project.irp.f:   4
    integer,allocatable :: maxj(:)                                  ! project.irp.f:   5
    real*8,allocatable :: p(:,:),max(:)                             ! project.irp.f:   6
    real*8 :: maxe                                                  ! project.irp.f:   7
  if (.not.c_is_built) then
    call provide_c
  endif
  if (.not.rank_is_built) then
    call provide_rank
  endif
    allocate (p(rank1,rank))                                        ! project.irp.f:   9
    allocate (maxj(rank))                                           ! project.irp.f:  10
    allocate (max(rank))                                            ! project.irp.f:  11
    p=0d0                                                           ! project.irp.f:  13
    do i=1,rank                                                     ! project.irp.f:  15
        do j=1,rank1                                                ! project.irp.f:  16
            do k=1,rank                                             ! project.irp.f:  17
                p(j,i)=p(j,i)+C(j,k)*DD(k,i)                        ! project.irp.f:  18
            enddo                                                   ! project.irp.f:  19
        enddo                                                       ! project.irp.f:  20
    enddo                                                           ! project.irp.f:  21
    write(6,*)'projected vectors'                                   ! project.irp.f:  23
    max=0d0                                                         ! project.irp.f:  24
    do i=1,rank                                                     ! project.irp.f:  26
        do j=1,rank1                                                ! project.irp.f:  27
            if(max(i).le.abs(p(j,i)))then                           ! project.irp.f:  28
                max(i)=abs(p(j,i))                                  ! project.irp.f:  29
                maxj(i)=j                                           ! project.irp.f:  30
            endif                                                   ! project.irp.f:  31
            write(6,12) (p(j,i))                                    ! project.irp.f:  32
        enddo                                                       ! project.irp.f:  33
        write(6,*)                                                  ! project.irp.f:  34
    enddo                                                           ! project.irp.f:  35
    write(6,*)'maxs'                                                ! project.irp.f:  37
    do i=1,rank                                                     ! project.irp.f:  38
        write(6,*)i,"-",maxj(i),max(i)                              ! project.irp.f:  39
    enddo                                                           ! project.irp.f:  40
    do i=1,rank                                                     ! project.irp.f:  42
        maxj(i)=i                                                   ! project.irp.f:  43
    enddo                                                           ! project.irp.f:  44
    write(6,*)'max energy'                                          ! project.irp.f:  45
    maxe=-1d10                                                      ! project.irp.f:  46
    do i=1,rank-1                                                   ! project.irp.f:  47
    do j=i+1,rank                                                   ! project.irp.f:  48
        if(e(j).lt.e(i))then                                        ! project.irp.f:  49
            maxe=e(j)                                               ! project.irp.f:  50
            e(j)=e(i)                                               ! project.irp.f:  51
            e(i)=maxe                                               ! project.irp.f:  52
            temp=maxj(j)                                            ! project.irp.f:  54
            maxj(j)=maxj(i)                                         ! project.irp.f:  55
            maxj(i)=temp                                            ! project.irp.f:  56
        endif                                                       ! project.irp.f:  57
    enddo                                                           ! project.irp.f:  58
    enddo                                                           ! project.irp.f:  59
    do i=1,rank                                                     ! project.irp.f:  60
        write(6,*)e(i),maxj(i)                                      ! project.irp.f:  61
    enddo                                                           ! project.irp.f:  62
    write(6,*)'projected on'                                        ! project.irp.f:  64
    do i=1,rank                                                     ! project.irp.f:  65
        do j=1,rank                                                 ! project.irp.f:  66
            write(6,12) (DD(j,i))                                   ! project.irp.f:  67
        enddo                                                       ! project.irp.f:  68
        write(6,*)                                                  ! project.irp.f:  69
    enddo                                                           ! project.irp.f:  70
   12   format((F8.2,' '),$)                                        ! project.irp.f:  72
contains                                                            ! project.irp.f:  73
end                                                                 ! project.irp.f:  75
