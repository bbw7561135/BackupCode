program funinterface
    implicit none
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    interface !hanshu shiyong jiekou
        function random10(leftbound,rightbound)
        implicit none
        real :: leftbound,rightbound
        real :: random10(10) !return an array with 10 elements
        end function random10
    end interface
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    real :: a(10)
    call random_seed() !fun instrinic
    a = random10(1.0,10.0)
    write(*,"(10F6.2)") a
end program funinterface

function random10(leftbound,rightbound)
    implicit none
    real :: leftbound,rightbound
    real :: length
    real :: random10(10)
    real :: t
    integer :: i
    length = rightbound - leftbound
    do i=1,10
        call random_number(t)
        random10(i) = leftbound + t*length
    end do
    return
end function random10
    
    
    
    
    
    
    
    
    
    
    
