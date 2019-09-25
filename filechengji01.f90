module typedef
    type student
        integer :: chinese,english,math
    end type
end module typedef

program duchengji
    use typedef
    implicit none
    type(student) :: s
    character(len=80) :: filename = "data.txt"
    integer,parameter :: field = 10
    logical :: alive
    integer :: error
    integer :: num
    
    inquire(file=filename,exist=alive)
    if(.not. alive) then
        write(*,*) trim(filename), "do not exist."
        stop !here stop can not be ignored because no file chengxu will end
    end if
    
    open(unit=field,file=filename)
    do while(.true.)
        read(field,"(5xi2,/,7xi3,7xi3,5xi3)",iostat=error) num,s !nx means wang you
        !tiao guo n ge zi fu kai shi du qu
        if(error/=0)then
            exit !error=0 means zheng chang duqu
        end if
        write(*,"(i2,'chinese',i3,'english',i3,'math',i3)") num,s
    end do
    close(unit=field)
end program duchengji














