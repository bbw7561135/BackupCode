program funpass
    implicit none
    real,external :: func !outer function
    real,intrinsic :: sin !library function
    
    call execfunc(func)
    call execfunc(sin)

end program funpass

subroutine execfunc(f)
    implicit none
    real,external :: f
    write(*,*) f(1.0)
    return
end subroutine execfunc

real function func(num)
    implicit none
    real :: num
    func = num * 2
    return
end function func


