BEGIN_PROVIDER [real*8, DDD,(rank,rank)]

    implicit none
    ! BEGIN_DOC
    ! diagonalize the projector matrix
    ! END_DOC

          double precision, allocatable :: EVAL(:),EVEC(:,:)
          double precision, allocatable :: A(:,:),W(:),WORK(:),AP(:)
          character*1 JOBZ,UPLO
          integer N,LDA,LWORK,INFO,i,j,l,m
          real*8 SUMAA,K

          N = rank

          allocate (A(N,N))
          allocate (AP(N*N))
          allocate (W(N))
          allocate (WORK(N*(2*N)))
          LDA=N
          UPLO='U'
          JOBZ='V'


          do i=1,N
            do j=1,N
                A(i,j)=DD(i,j)
            enddo
          enddo

          do i=1,N
            write(11,1022)i,(A(i,j),j=1,N)
          enddo

 1022 FORMAT(3x,I3,10(2x,F12.4))


          K=0
          do j=1,N
          do i=1,j
            AP(i+(j-1)*j/2)=A(i,j)
            K=K+1
          enddo
          enddo

!         LWORK=-1
!         call DSPEV( JOBZ, UPLO, N, AP, W, A, LDA, WORK, INFO)
!         LWORK=INT(WORK(1))
!         write(6,*)LWORK

          call DSPEV( JOBZ, UPLO, N, AP, W, A, LDA, WORK, INFO)
          write(6,*)INFO

          if (INFO.ne.0)then
              print*,'Error at dspev'
              call exit(1)
          endif

          do i=1,N
            write(12,1022)i,W(i)
          enddo

          do i=1,N
            write(22,1022)i,(A(i,j),j=1,N)
          enddo

          do i=1,N
            do j=1,N
                DDD(i,j)=A(i,j)
            enddo
          enddo

END_PROVIDER
