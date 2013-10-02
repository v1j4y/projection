subroutine irp_finalize_2027207563
 use c_mod
 use rank_mod
  if (allocated(c)) then
    c_is_built = .False.
    deallocate(c)
  endif
  if (allocated(e)) then
    c_is_built = .False.
    deallocate(e)
  endif
  if (allocated(dd)) then
    c_is_built = .False.
    deallocate(dd)
  endif
  if (allocated(ei)) then
    c_is_built = .False.
    deallocate(ei)
  endif
end
