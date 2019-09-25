program hello
    use mpi
    implicit none
    integer :: ierrmpi,myprocess,totalprocess
    character(len=MPI_MAX_PROCESSOR_NAME) :: hostname
    integer :: hostlen
    call MPI_INIT(ierrmpi)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myprocess,ierrmpi)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,totalprocess,ierrmpi)
    call MPI_GET_PROCESSOR_NAME(hostname,hostlen,ierrmpi)
    write(*,*) "Hello from process ",myprocess
    write(*,*) "total process is",totalprocess
    write(*,*) "the host is",hostname
    call MPI_FINALIZE(ierrmpi)
end program hello
