program hanshu
    implicit none
    real :: a = 3
    real :: b = 5
    real,external :: add
    write(*,*) add(a,b)
end program hanshu

real function add(a,b)
    implicit none
    real :: a,b
    add = a + b
    return
end function add
