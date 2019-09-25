module jifen
    implicit none
    real,parameter :: pi = 3.141593
contains
    subroutine generatedata(datas,width,func)
        implicit none
        real :: datas(:),width
        real,external :: func
        real :: r
        integer i,n
        n = size(datas,1)
        width = pi/(n-1) !x qu jian shi 0-pi
        r = 0
        do i=1,n
            datas(i) = func(r)
            r = r+width
        end do
    end subroutine generatedata

!ti xing jifen
    real function tixingfa(datas,width)
        implicit none
        real :: datas(:)
        real :: width
        real :: jifenzhi
        integer :: i,n

        n = size(datas,1)
        jifenzhi = (datas(1)+datas(n))/2.0
        do i=2,n-1
            jifenzhi = jifenzhi + datas(i)
        end do
        tixingfa = jifenzhi*width
        !shang mian zhe ji ge yu ju xu yao tui dao
        !width*[(data1+data2)+(data2+data3)+.....(datan-1+datan)]/2.0
        !=width*0.5*(data1+datan)+(data2+...+datan-1)
        return
    end function tixingfa

end module jifen

program main
    use jifen
    implicit none
    integer,parameter :: n = 100000
    real :: datas(n),width
    real :: ans
    real,intrinsic :: sin
    call generatedata(datas,width,sin)
    ans = tixingfa(datas,width)
    write(*,"('ans = ',f6.3)") ans

end program main
