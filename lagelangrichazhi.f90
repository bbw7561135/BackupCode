module chazhi
    implicit none
    type point
        real :: x,y
    end type point
    real,parameter :: pi=3.141593
    real,parameter :: xmin = 0.0, xmax = pi * 3.0
    integer,parameter :: n=10,np=100
    type(point) :: datas(n) !yi zhi de shu ju dian
    type(point) :: interpolate(np) !dai cha zhi de qian
contains
    subroutine generatedata(func)
        real,external :: func
        real r,width
        integer i
        width = (xmax-xmin)/(n-1)
        r = 0
        do i=1,n
            datas(i)%x = r
            datas(i)%y = func(r)
            r = r + width
        end do
    end subroutine generatedata

    real function lagrange(x)
        implicit none
        real :: x
        real :: coeff
        integer :: i,j
        lagrange = 0
        do i=1,n
            coeff = 1
            do j=1,n
                if(i/=j)then
                    coeff=coeff*(x-datas(j)%x)/(datas(i)%x-datas(j)%x)
                end if
            end do
            lagrange = lagrange + coeff*datas(i)%y
        end do
    end function lagrange

end module chazhi


program main
    use chazhi
    implicit none
    real,intrinsic :: sin
    real :: xinc,x
    integer :: i

    call generatedata(sin)
    x=0.0
    xinc=(xmax-xmin)/(np-1)
    do i=1,np
        interpolate(i)%x=x
        interpolate(i)%y=lagrange(x)
        write(*,"('x=',f6.3,3x,'y=',f6.3)") interpolate(i)%x,interpolate(i)%y
        x=x+xinc
    end do

end program main
























































