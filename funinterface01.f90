program optpara
    implicit none
    interface
        subroutine sub(a,b)
        implicit none
        integer :: a
        integer,optional :: b
        end subroutine sub
    end interface

    call sub(1)
    call sub(2,3)
end program optpara

subroutine sub(a,b)
    implicit none
    integer :: a
    integer,optional :: b
    if(present(b)) then !present is a library fun return value is T or F
        write(*,"('a=',i3,'b=',i3)") a,b
    else
        write(*,"('a=',i3,'b=unknown')") a
    end if
    return
end subroutine sub




