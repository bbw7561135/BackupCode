program binaryread
    implicit none
    integer,parameter :: fileid = 10
    character(len=20) :: filename = "list.bin"
    real :: hit
    integer :: player
    logical :: alive
    integer :: error

    inquire(file=filename,exist=alive)
    if(.not. alive)then
        write(*,*) trim(filename),"do not exist."
        stop !can not be ingored here
    end if

    open(unit=fileid,file=filename,form="unformatted",access="direct",recl=4,status="old")

    do while(.true.)
        write(*,"('which bang')")
        read(*,*) player
        read(fileid,rec=player,iostat=error) hit
        if(error/=0)then
            exit
        end if
        write(*,"('hit rate:',f5.2)") hit
    end do
    close(unit=fileid)
end program binaryread
