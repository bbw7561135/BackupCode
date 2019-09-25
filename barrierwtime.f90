program main
    use mpi
    integer(kind=4),parameter :: n = 5
    integer :: myid,numprocs,ierr
    real(kind=8) :: time1,time2 !must be kind=8
    call MPI_INIT(ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,ierr)
    time1 = MPI_WTIME()
    do i=1,n
        call sleep(1) !unit is second
    end do
    time2 = MPI_WTIME()
    call MPI_BARRIER(MPI_COMM_WORLD,ierr)

    write(*,*) "total ranks: ",numprocs
    write(*,*) "my rank ",myid
    write(*,*) "my running time ",time2-time1

    call MPI_FINALIZE(ierr)
end program main

