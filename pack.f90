program dabao
    use mpi
    implicit none
    integer,parameter :: bufsize=100
    integer :: myid,allprocs,ierr
    character(len=bufsize) :: buffer
    character(len=20) :: str = "FortranIsGood"
    integer :: a(2)=126
    integer :: ipos = 0 !offset should be set 0 and it will update automatically
    call MPI_INIT(ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,allprocs,ierr)

    if(myid==0)then
        call MPI_PACK(a(1),2,MPI_INTEGER,buffer,bufsize,ipos,MPI_COMM_WORLD,ierr)
        call MPI_PACK(str,20,MPI_CHARACTER,buffer,bufsize,ipos,MPI_COMM_WORLD,ierr)
        !ipos will update automatically what you should do is set ipos=0
        !at the beginning !send the data to rank1 and unpack them !tag is 99
        !the data type is MPI_PACKED
        call MPI_SEND(buffer,bufsize,MPI_PACKED,1,99,MPI_COMM_WORLD,ierr)
    end if

    if(myid==1)then
        !should receive data at first then unpack them
        call MPI_RECV(buffer,bufsize,MPI_PACKED,0,99,MPI_COMM_WORLD,MPI_STATUS_IGNORE,ierr)
        !if no need for status just use MPI_STATUS_IGNORE
        call MPI_UNPACK(buffer,bufsize,ipos,a(1),2,MPI_INTEGER,MPI_COMM_WORLD,ierr)
        call MPI_UNPACK(buffer,bufsize,ipos,str,20,MPI_CHARACTER,MPI_COMM_WORLD,ierr)
        !for array a=a(1) to represent the first adress but for string it must be the name
    end if

    call MPI_BARRIER(MPI_COMM_WORLD,ierr) !tong bu
    if(myid==1)then
        write(*,*) "total ranks: ",allprocs
        write(*,*) "the array a in rank ",myid
        write(*,*) a
        write(*,*) str
    end if

    call MPI_FINALIZE(ierr)
end program dabao
