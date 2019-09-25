program duqu
    implicit none
    character(len=79) :: filename
    character(len=79) :: buffer
    integer,parameter :: field = 10
    integer :: status = 0 !this var has save shu xing. zai subroutine zhong yao xiao xin shi yong
    logical :: alive
    
    write(*,*) "Filename: "
    read(*,"(a79)") filename
    inquire(file=filename,exist=alive)
    if(alive)then
        open(unit=field,file=filename,access="sequential",status="old")
        do while(.true.)
            read(unit=field,fmt="(a79)",iostat=status) buffer
            if(status /= 0)then
                exit !status=0 du qu zhengchang fou ze jiu shi cuo wu
            end if
            write(*,"(a79)") buffer
        end do
    else
        write(*,*) trim(filename), "do not exist."
    end if
end program duqu
