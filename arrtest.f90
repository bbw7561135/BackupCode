program arrtst
 implicit none
 integer(kind=4),parameter :: row = 2 !hang
 integer(kind=4),parameter :: col = 2 !lie
 integer(kind=4) :: m(row,col)
 integer(kind=4) :: n(row,col) = 2 !each element is 2
 integer(kind=4) :: k(row,col) = 0 !each elemrnt is 0
 integer(kind=4) :: l(row+1,col+1)
 logical :: tf(row,col)
 integer(kind=4) :: r !for iter for row
 integer(kind=4) :: c !for iter for col
 
 data((m(r,c),r=1,2),c=1,2) /1,2,3,4/ !inside r is the inner loop
 !whici means that the assginment is an lie fu zhi the result shold
 !be 1 3
 !   2 4
 data l /1,2,3,4,5,6,7,8,9/ !default is an lie fu zhi
 do r=1,row+1
    do c=1,col+1
        write(*,"(i1,i1,i3)") r,c,l(r,c)
    end do
 end do 
 write(*,"(i3,i3,/,i3,i3)") ((m(r,c),c=1,2),r=1,2) !here is an hang shu chu
 k = m + n !same position's value add together
 write(*,"(i3,i3,/,i3,i3)") ((k(r,c),c=1,2),r=1,2) !here is an hang shu chu
 outer:do r=1,row
    inner:do c=1,col
        write(*,"(i1,i1,i3)") r,c,k(r,c)
    end do inner
 end do outer
 
 tf = k > m !for each element in same position compare k > m return value is
 !true or false put into tf
 do r=1,row
    do c=1,col
        write(*,"(i3,i3,l3)") r,c,tf(r,c) !l for output logical value
    end do
 end do  
 !fortran array operation like python or you can say python like fortran
 
end program arrtst
