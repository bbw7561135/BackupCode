program element
    implicit none
    interface
        elemental real function func(num)
        implicit none
        real,intent(in) :: num !pure elemental func parameters must be
        !read only = intent(in)
        end function func
    end interface

    integer i
    real :: a(10)=(/(i,i=1,10)/)
    real :: b(10)
    
    write(*,"(10F6.2)") a
    b = func(a)
    write(*,"(10F6.2)") b
end program element

elemental real function func(num)
    implicit none
    real,intent(in) :: num
    func = sin(num) + cos(num)
    return
end function func


