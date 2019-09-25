program guangbo
    use mpi
    implicit none
    integer,parameter :: arrsize=5
    integer :: myid,ierr,allprocs,slice
    real(kind=8) :: a(arrsize)=0.0!,b(arrsize)=2.0
    real(kind=8) :: b(arrsize)=0.0
    call MPI_INIT(ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,allprocs,ierr)
    if(myid==0)then
        b(1:arrsize)=126.0
    end if
    call MPI_BCAST(b(1),5,MPI_DOUBLE_PRECISION,0,MPI_COMM_WORLD,ierr)
    write(*,*) "total ranks: ",allprocs
    write(*,*) "the array a in rank ",myid
    write(*,*) b

    call MPI_FINALIZE(ierr)

end program guangbo
