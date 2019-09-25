program neibuwenjian
    implicit none
    integer :: a = 2
    integer :: b = 3
    integer :: c
    character(len=20) :: string
    character(len=20) :: string1="123"

    write(unit=string,fmt="(i2,'+',i2,'=',i2)") a,b,a+b
    !write sth into string
    write(*,*) string
    
    read(string1,*) c
    write(*,*) c
end program neibuwenjian
