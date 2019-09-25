program binarywrite
    implicit none
    integer,parameter ::fileid = 10
    character(len=20) :: filename = "list.bin"
    integer :: player
    real :: hit(9) =(/3.2,2.8,3.3,3.2,2.9,2.7,2.2,2.3,1.9/)

    open(unit=fileid,file=filename,form="unformatted",access="direct",recl=4,status="replace")
!unformatted = binary recl=4 is different in various complier or system should be careful
    do player=1,9
        write(fileid,rec=player) hit(player)
    end do

    close(fileid)
end program binarywrite
