program digui
    implicit none
    integer :: n
    !integer,external :: fact !fun declare
    write(*,*) "N="
    read(*,*) n
    write(*,"(i2,'!=',i8)") n,fact(n)
    contains !contains mean fact only work for program digui so
             !the shengming can be omited
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

end program digui







