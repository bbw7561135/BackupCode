program digui
    implicit none
    integer :: n
    integer,external :: fact !fun declare
    write(*,*) "N="
    read(*,*) n
    write(*,"(i2,'!=',i8)") n,fact(n)
end program digui

recursive integer function fact(n) result(ans) !ans is another name of fact
    implicit none
    integer,intent(in) :: n
    if(n<0)then
        ans = -1
        return
    else if(n<=1) then
        ans=1
        return
    end if

    ans = n * fact(n-1)
    return
end function fact
