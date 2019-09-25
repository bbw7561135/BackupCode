program defaultpara
    implicit none
    interface
        real function func(x,a,b,c) !f(x)=Ax^2+Bx+C
        implicit none
        real :: x
        real,optional :: a,b,c
    end function func
    end interface

    write(*,*) func(2.0,c=1.0) !f = 0*2^2+0*2+1=1
    write(*,*) func(2.0,a=2.0,b=1.0) !f=2*2^2+1*2+0=10
end program defaultpara

!f(x)=Ax^2+Bx+C
!default value A=B=C=0
real function func(x,a,b,c)
    implicit none
    real :: x
    real,optional :: a,b,c
    real :: ra,rb,rc
    
    if(present(a)) then
        ra=a
    else
        ra=0.0 !default value=0
    end if
    
    if(present(b)) then
        rb=b
    else
        rb=0.0
    end if

    if(present(c)) then
        rc=c
    else
        rc=0.0
    end if
    
    func = ra * x**2 + rb*x + rc
    
    return
end function func
    
    
    
