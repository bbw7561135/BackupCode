module shocktube
    implicit none
    real(kind=8),parameter :: pi = 3.1415926
    real(kind=8),parameter :: gama = 1.4
    real(kind=8),parameter :: domain = 2.0 !-1.0-1.0
    real(kind=8),parameter :: total_time = 0.4 !s
    real(kind=8),parameter :: step_factor = 0.8 !time step factor
    integer(kind=4),parameter :: grids = 2000 !grids number
    real(kind=8):: U(grids+2,3),Uflux(grids+2,3),Eflux(grids+2,3)!2 ghost cells
    real(kind=8) :: dx !grid width
    !U is rho rho*u E respectively. E is rho*u rho*u*u+p (E+p)*u
end module shocktube

program riemann
    use shocktube
    implicit none
    integer(kind=4) :: i
    real(kind=8) :: time = 0.0
    real(kind=8) :: dt 
    call init()
!    do i=1,grids+2
!        write(*,*) "rho = ",U(i,1), "vel = ", U(i,2), "pre = ",U(i,3)
!    end do
    do while(time<total_time)
        call CFL(dt)
        time = time + dt
        write(*,*) "time = ",time,"dt = ",dt
        call MacCormack_Solver1d(dt)
        call boundary()
    end do

    call output()

end program riemann

subroutine init() !set initial values for all grids
    use shocktube
    implicit none
    integer(kind=4) :: i
    real(kind=8) :: rho1=1.0,u1=0.0,p1=1.0 !initial values in left
    real(kind=8) :: rho2=0.125,u2=0.1,p2=0.1 !initial values in right
    dx = domain/grids
    !grid from 1 to 102 but 1 and 102 are ghost cells while 2-101 are real domain grids
    do i=1,grids/2+1
        U(i,1)=rho1
        U(i,2)=rho1*u1
        U(i,3)=p1/(gama-1.0)+rho1*u1*u1/2.0
    end do

    do i=grids/2+2,grids+2
        U(i,1)=rho2
        U(i,2)=rho2*u2
        U(i,3)=p2/(gama-1.0)+rho2*u2*u2/2.0
    end do
    return
end subroutine init



subroutine CFL(dt) !to calculate the time step
    use shocktube
    implicit none
    real(kind=8) :: dt
    integer(kind=4) :: i
    real(kind=8) :: maxvel,p,v,vel
    maxvel = 1.0d-100
    do i=2,grids+1 !domain is from 2 to 101
        v=U(i,2)/U(i,1)
        p=(gama-1.0)*(U(i,3)-0.5*U(i,1)*v*v)
        vel=sqrt(gama*p/U(i,1)) + abs(v)
        if(vel>maxvel)maxvel=vel
    end do
    dt=step_factor*dx/maxvel
    return
end subroutine CFL

subroutine boundary()
    use shocktube
    implicit none
    integer(kind=4) :: k
    do k=1,3
        U(1,k)=U(2,k) !left boundary
        U(grids+2,k)=U(grids+1,k)!right boundary
    end do
    return
end subroutine boundary


subroutine U2E(uone,eone) !u to e for each grid
    use shocktube
    implicit none
    real(kind=8) :: uone(3),eone(3)
    real(kind=8) :: v,p
    v=uone(2)/uone(1)
    p=(gama-1.0)*(uone(3)-0.5*uone(2)*uone(2)/uone(1))
    eone(1)=uone(2)
    eone(2)=uone(1)*v*v+p
    eone(3)=(uone(3)+p)*v
    return
end subroutine U2E


subroutine MacCormack_Solver1d(dt)
    use shocktube
    implicit none
    integer(kind=4) :: i,k
    real(kind=8) :: r,nu,q,q1,q2,dt
    !dt is parameter in dx is in module shocktube
    r=dt/dx
    nu=0.25 !eta is viscosity parameter
    do i=2,grids+1 !domain loop
        q1=abs(abs(U(i+1,1)-U(i,1))-abs(U(i,1)-U(i-1,1)))
        q2=abs(abs(U(i+1,1)-U(i,1))+abs(U(i,1)-U(i-1,1)))+1.0d-100
        q=q1/q2 !open-close function
        do k=1,3
            Eflux(i,k)=U(i,k)+0.5*nu*q*(U(i+1,k)-2.0*U(i,k)+U(i-1,k))
            !here Eflux is used for temporal store of new U not its origianl use
        end do
    end do

    do k=1,3
        do i=2,grids+1
            U(i,k)=Eflux(i,k) !Eflux is temporal store of U with viscosity
        end do
    end do

    do i=1,grids+2 !all domain contains ghost cells
        call U2E(U(i,:),Eflux(i,:))
    end do

    do i=1,grids+1 !cell centered i+1/2
        do k=1,3
            Uflux(i,k)=U(i,k)-r*(Eflux(i+1,k)-Eflux(i,k)) !U_n+1/2_j+1/2
        end do
    end do

    do i=1,grids+1 !cell centered i+1/2
        call U2E(Uflux(i,:),Eflux(i,:)) !E_n+1/2_j+1/2
    end do


    do i=2,grids+1 !domain loop
        do k=1,3
            U(i,k)=0.5*(U(i,k)+Uflux(i,k))-0.5*r*(Eflux(i,k)-Eflux(i-1,k)) !U_n+1_i
        end do
    end do

    return
end subroutine MacCormack_Solver1d



subroutine output()
    use shocktube
    implicit none
    integer(kind=4) :: i
    real(kind=8) :: rho,vel,prs
    open(unit=10,file="data1d.txt")
    do i=1,grids+2
        rho=U(i,1)
        vel=U(i,2)/rho
        prs=(gama-1.0)*(U(i,3)-0.5*U(i,1)*vel*vel)
        write(10,*) (i-1)*dx,rho,vel,prs
    end do
    close(10)
    return
end subroutine output





































































































