!er fen fa qiu gen
module numerical
    implicit none
    real,parameter :: zero = 0.00001 !tolerance
contains
    real function bisect(a,b,func)
        implicit none
        real :: a,b
        real :: c
        real :: fa
        real :: fb
        real :: fc
        real,external :: func !function to be solved

        c=(a+b)/2.0
        fc=func(c)
        do while(abs(fc)>zero)
            fa = func(a)
            fb = func(b)
            if(fa*fc<0) then
                b=c ! c replace b
                c=(a+b)/2.0 !new c
            else
                a=c !c replace a
                c=(a+b)/2.0
            end if
        end do
        bisect = c !c is the result
        return
    end function bisect

    real function f1(x)
        implicit none
        real :: x
        f1 = (x+3.)*(x-3.)
        return
    end function f1

    real function f2(x)
        implicit none
        real :: x
        f2 = (x+4.)*(x-5.)
        return
    end function f2


end module numerical


program main
    use numerical
    implicit none
    real :: a,b
    real :: ans
    do while(.true.)
        write(*,*) "two guessing value"
        read(*,*) a,b
        if(f1(a)*f1(b)<0) then
            exit
        end if
        write(*,*) "improper values"
    end do

    ans = bisect(a,b,f1)
    write(*,"('x=',f6.3)") ans


    do while(.true.)
        write(*,*) "two guessing value"
        read(*,*) a,b
        if(f2(a)*f2(b)<0) then
            exit
        end if
        write(*,*) "improper values"
    end do

    ans = bisect(a,b,f2)
    write(*,"('x=',f6.3)") ans


end program main



















