program fushu
    implicit none
    complex :: a,b
    a = (1.0,1.0) !a=1+1i
    b = (1.0,2.0) !b=1+2i
    write(*,*) "a+b",a+b
    write(*,*) "a-b",a-b
    write(*,*) "a*b",a*b
    write(*,*) "a/b",a/b
end program fushu
