program arrini
 implicit none
 integer(kind=4),parameter :: arrsize = 7
 integer(kind=4):: a(arrsize)
 integer(kind=4):: b(arrsize)
 integer(kind=4):: c(arrsize) = (/1,3,5,7,9,11,13/) !no space between ( and /
 integer(kind=4):: i
 DATA a /7*9/
 
 do i=1, arrsize, 1
    write(*,*) a(i)
 end do

 DATA(b(i),i=1,6) /1,2,3,4,5,6/
 b(7) = 888
 do i=1, arrsize, 1
    write(*,*) b(i)
 end do

 do i=1, arrsize, 1
    write(*,*) c(i)
 end do

end program arrini 
