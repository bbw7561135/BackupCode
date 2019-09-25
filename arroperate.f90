program arrop
 implicit none
 integer,parameter :: row = 2
 integer,parameter :: col = 2
 integer :: a(2,2)
 integer :: d(2,2)=0
 !a is assign by col then by row so it should be
 !1 3
 !2 4
 data a /1,2,3,4/
 integer :: b(4) = (/ 5,6,7,8 /)
 !integer :: c(2,2) = (/ 5,6,7,8 /) 2d can not be set ini by this form
 integer :: c(2)
 
 write(*,*) a !also shown by col then by row and it should be 1 2 3 4
 write(*,*) a(:,1) !first col 12
 write(*,*) a(1,:) ! first row 13
 write(*,*) b 
 c = a(:,1) !assign 1 col to c so c should be 1 2
 write(*,*) c
 write(*,*) c(2:1:-1)!c2 shown first
 write(*,*) b 
 
 
end program arrop 
