program wenjian
    implicit none
    integer,parameter :: field = 10
    logical :: alive
    character(len=20) :: filename
    
    write(*,*) "input a filename:"
    read(*,"(a20)") filename

    inquire(file=filename,exist=alive)
    if(alive)then
        open(unit=field,file=filename)
        close(unit=field,status="delete")
        !if file exist then delete it ...stupid operation
    else
        write(*,*) trim(filename), "do not exist." !trim is to delete the space behind the string
    end if
end program wenjian 
