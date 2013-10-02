! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_rank
  use rank_mod
  implicit none
  character*(12) :: irp_here = 'provide_rank'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
 if (.not.rank_is_built) then
  call bld_rank
  rank_is_built = .True.

 endif
end subroutine provide_rank

subroutine bld_rank
  use rank_mod
    implicit none                                                      ! rank.irp.f:   4
  character*(4) :: irp_here = 'rank'                                   ! rank.irp.f:   1
    rank=20                                                            ! rank.irp.f:   9
    rank1=22                                                           ! rank.irp.f:  10
end subroutine bld_rank
