program biao
 implicit none
    integer,parameter :: players = 5
    real :: angle(players) = (/30.0,45.0,35.0,50.0,40.0/)
    real :: speed(players) = (/25.0,20.0,21.0,27.0,22.0/)
    real :: distance(players)
    integer :: i
    
    do i=1,players
        call get_distance(angle(i),speed(i),distance(i))
    write(*,"('players ',i1,'=',f8.3)") i,distance(i)
    end do

end program biao

!chang angle to hudu
subroutine angle_to_rad(angle,rad)
    implicit none
    real angle,rad
    real,parameter :: pi = 3.141593
    
    rad = angle/360.0*2.0*pi
    return
end subroutine angle_to_rad

!calculate the distance via rad and velocity
subroutine get_distance(angle,speed,distance)
    implicit none
    real :: angle,speed
    real :: distance
    real :: rad,Vx,time
    real,parameter :: g = 9.81
    
    call angle_to_rad (angle,rad)
    Vx = speed * cos(rad) !velocity in the X direction
    time = 2.0 * speed * sin(rad)/g !total time for flying
    distance = Vx * time !total distance in X direction
    return
end subroutine get_distance






























