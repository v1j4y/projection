! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_ddd
  use diagon_mod
  use c_mod
  use rank_mod
  implicit none
  character*(11) :: irp_here = 'provide_ddd'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
  if (.not.c_is_built) then
    call provide_c
  endif
  if (.not.rank_is_built) then
    call provide_rank
  endif
 if (allocated (ddd) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(ddd,1)==(rank))
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(ddd,2)==(rank))
  if (.not.irp_dimensions_OK) then
   deallocate(ddd,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: ddd'
     print *, ' size: (rank,rank)'
   endif
   if ((rank>0).and.(rank>0)) then
    allocate(ddd(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: ddd'
     print *, ' size: (rank,rank)'
    endif
   endif
  endif
 else
   if ((rank>0).and.(rank>0)) then
    allocate(ddd(rank,rank),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: ddd'
     print *, ' size: (rank,rank)'
    endif
   endif
 endif
 if (.not.ddd_is_built) then
  call bld_ddd
  ddd_is_built = .True.

 endif
end subroutine provide_ddd

subroutine bld_ddd
  use diagon_mod
  use c_mod
  use rank_mod
    implicit none                                                    ! diagon.irp.f:   3
  character*(3) :: irp_here = 'ddd'                                  ! diagon.irp.f:   1
          double precision, allocatable :: EVAL(:),EVEC(:,:)         ! diagon.irp.f:   8
          double precision, allocatable :: A(:,:),W(:),WORK(:),AP(:) ! diagon.irp.f:   9
          character*1 JOBZ,UPLO                                      ! diagon.irp.f:  10
          integer N,LDA,LWORK,INFO,i,j,l,m                           ! diagon.irp.f:  11
          real*8 SUMAA,K                                             ! diagon.irp.f:  12
          N = rank                                                   ! diagon.irp.f:  14
          allocate (A(N,N))                                          ! diagon.irp.f:  16
          allocate (AP(N*N))                                         ! diagon.irp.f:  17
          allocate (W(N))                                            ! diagon.irp.f:  18
          allocate (WORK(N*(2*N)))                                   ! diagon.irp.f:  19
          LDA=N                                                      ! diagon.irp.f:  20
          UPLO='U'                                                   ! diagon.irp.f:  21
          JOBZ='V'                                                   ! diagon.irp.f:  22
          do i=1,N                                                   ! diagon.irp.f:  25
            do j=1,N                                                 ! diagon.irp.f:  26
                A(i,j)=C(i,j)                                        ! diagon.irp.f:  27
            enddo                                                    ! diagon.irp.f:  28
          enddo                                                      ! diagon.irp.f:  29
          do i=1,N                                                   ! diagon.irp.f:  31
            write(11,1022)i,(A(i,j),j=1,N)                           ! diagon.irp.f:  32
          enddo                                                      ! diagon.irp.f:  33
 1022 FORMAT(3x,I3,10(2x,F12.4))                                     ! diagon.irp.f:  35
          K=0                                                        ! diagon.irp.f:  38
          do j=1,N                                                   ! diagon.irp.f:  39
          do i=1,j                                                   ! diagon.irp.f:  40
            AP(i+(j-1)*j/2)=A(i,j)                                   ! diagon.irp.f:  41
            K=K+1                                                    ! diagon.irp.f:  42
          enddo                                                      ! diagon.irp.f:  43
          enddo                                                      ! diagon.irp.f:  44
          call DSPEV( JOBZ, UPLO, N, AP, W, A, LDA, WORK, INFO)      ! diagon.irp.f:  51
          write(6,*)INFO                                             ! diagon.irp.f:  52
          if (INFO.ne.0)then                                         ! diagon.irp.f:  54
              print*,'Error at dspev'                                ! diagon.irp.f:  55
              call exit(1)                                           ! diagon.irp.f:  56
          endif                                                      ! diagon.irp.f:  57
          do i=1,N                                                   ! diagon.irp.f:  59
            write(12,1022)i,W(i)                                     ! diagon.irp.f:  60
            E(i)=W(i)                                                ! diagon.irp.f:  61
          enddo                                                      ! diagon.irp.f:  62
    do i=1,rank                                                      ! diagon.irp.f:  64
        do j=1,rank                                                  ! diagon.irp.f:  65
            if(j.eq.i)then                                           ! diagon.irp.f:  66
            EI(j,i)=E(i)                                             ! diagon.irp.f:  67
            else                                                     ! diagon.irp.f:  68
            EI(j,i)=0d0                                              ! diagon.irp.f:  69
            endif                                                    ! diagon.irp.f:  70
        enddo                                                        ! diagon.irp.f:  71
    enddo                                                            ! diagon.irp.f:  72
          do i=1,N                                                   ! diagon.irp.f:  74
            write(22,1022)i,(A(i,j),j=1,N)                           ! diagon.irp.f:  75
          enddo                                                      ! diagon.irp.f:  76
          do i=1,N                                                   ! diagon.irp.f:  78
            do j=1,N                                                 ! diagon.irp.f:  79
                DDD(i,j)=A(i,j)                                      ! diagon.irp.f:  80
            enddo                                                    ! diagon.irp.f:  81
          enddo                                                      ! diagon.irp.f:  82
end subroutine bld_ddd
