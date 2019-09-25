program sendrecive
    use mpi
    implicit none
    integer :: ierrmpi,myprocess,totalprocess
    integer :: statusmpi(MPI_STATUS_SIZE)
    real :: a(10)=0.0,b(10)=5.0!each rank has its own a and b
    integer :: i
    call MPI_INIT(ierrmpi)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myprocess,ierrmpi)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,totalprocess,ierrmpi)
    b(1:10)=myprocess+1
    if(myprocess==0)then
        call MPI_SENDRECV(b(1),5,MPI_REAL,1,99,&
                          a(1),5,MPI_REAL,2,100,MPI_COMM_WORLD,statusmpi,ierrmpi)
        !send b(1)-b(5) to rank1 to replace b(1)-b(5) in rank1 
        !99 100 is the tag
        !recv 5 real to store in a(1)-a(5) from rank2
    else if(myprocess==1)then
        call MPI_RECV(a(1),5,MPI_REAL,0,99,MPI_COMM_WORLD,statusmpi,ierrmpi)
        !receive 5 real from rank0 to store in a(1:5)
    else if(myprocess==2)then
        call MPI_SEND(b(1),5,MPI_REAL,0,100,MPI_COMM_WORLD,ierrmpi)
        !send b(1:5) to rank0
    end if
    call MPI_BARRIER(MPI_COMM_WORLD,ierrmpi) !tong bu
    !then check the result
    if(myprocess==0)then
        write(*,*) "a in process 0: ",a !a(1:5) should be 3
    else if(myprocess==1)then
        write(*,*) "a in process 1: ",a !a(1:5) should be 1
    end if
    call MPI_FINALIZE(ierrmpi)
end program sendrecive
