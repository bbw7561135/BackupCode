program allreduction
    use mpi
    implicit none
    integer :: myid,ierr,allprocs
    real(kind=8) :: a=0.0!,b(arrsize)=2.0
    real(kind=8) :: b=0.0
    call MPI_INIT(ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,allprocs,ierr)
    b=myid
    call MPI_ALLREDUCE(b,a,1,MPI_DOUBLE_PRECISION,MPI_SUM,MPI_COMM_WORLD,ierr)
        write(*,*) "total ranks: ",allprocs
        write(*,*) "my id is",myid
        write(*,*) "the reuslt sum is",a


    call MPI_FINALIZE(ierr)

end program allreduction
