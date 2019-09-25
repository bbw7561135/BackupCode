program allgather
    use mpi
    implicit none
    integer,parameter :: arrsize=10
    integer :: myid,ierr,allprocs
    real(kind=8) :: a(arrsize)=0.0!,b(arrsize)=2.0
    real(kind=8) :: b(2)=0.0
    call MPI_INIT(ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,allprocs,ierr)
    b(1:2)=myid
    call MPI_ALLGATHER(b(1),2,MPI_DOUBLE_PRECISION,a(1),2,MPI_DOUBLE_PRECISION,&
                        & MPI_COMM_WORLD,ierr)
    write(*,*) "total ranks: ",allprocs
    write(*,*) "the array a in rank ",myid
    write(*,*) a

    call MPI_FINALIZE(ierr)

end program allgather
