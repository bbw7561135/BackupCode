program main
    use mpi
    implicit none
    integer,parameter :: n=10
    real(kind=8) :: a(n)=1.0
    real(kind=8) :: b(n)=26.0
    integer :: myid,numprocs,ierr,tag1,tag2
    integer :: statusmpi(MPI_STATUS_SIZE,2)!store by column not row !not like c
    integer :: request(2) !like ierr no need for inital set

    call MPI_INIT(ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,ierr)
    !send ran0 a to rank1 b and rank0 b to rank1 a i.e. exchange a b
    tag1 = 110
    tag2 = 220
    if(myid==0)then
        call MPI_ISEND(a(1),n,MPI_DOUBLE_PRECISION,1,tag1,MPI_COMM_WORLD,request(1),ierr)
        call MPI_ISEND(b(1),n,MPI_DOUBLE_PRECISION,1,tag2,MPI_COMM_WORLD,request(2),ierr)
    end if
    if(myid==1)then
        call MPI_IRECV(b(1),n,MPI_DOUBLE_PRECISION,0,tag1,MPI_COMM_WORLD,request(1),ierr)
        call MPI_IRECV(a(1),n,MPI_DOUBLE_PRECISION,0,tag2,MPI_COMM_WORLD,request(2),ierr)
        call sleep(2)
        call MPI_WAITALL(2,request,statusmpi,ierr) !2 request for check
    end if

    if(myid==1)then
        write(*,*) "total ranks: ",numprocs
        write(*,*) "the array b in rank ",myid
        write(*,*) b
        write(*,*) "the array a in rank ",myid
        write(*,*) a
    end if

    call MPI_FINALIZE(ierr)
end program main
