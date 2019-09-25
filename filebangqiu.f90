program bangqiu
    implicit none
    integer,parameter :: fileid = 10
    character(len=20) :: filename = "hhh.txt"
    integer :: player
    real :: hit
    integer :: error
    logical :: alive

    inquire(file=filename,exist=alive)
    if(.not. alive)then
        write(*,*) trim(filename),"do not exist."
        stop
    end if

    open(unit=fileid,file=filename,access="direct",form="formatted",recl=5,status="old")
    !see page 254-256 for details
    do while(.true.)
        write(*,"('inquire which bang')")
        read(*,*) player
        read(fileid,fmt="(f4.2)",rec=player,iostat=error) hit
        if(error/=0)then
            exit
        end if
        write(*,"('hit rate is:'f4.2)") hit
    end do
    close(unit=fileid)
end program bangqiu


















