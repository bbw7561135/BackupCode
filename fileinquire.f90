program chaxun
    implicit none
    character(len=20) :: filename = "test.txt"
    logical :: alive
    
    inquire(file=filename,exist=alive) !which means the exist value is logical
    if(alive) then !which means alive=True
        write(*,*) filename,"exist."
    else
        write(*,*) filename,"do not exist."
    end if
end program chaxun
