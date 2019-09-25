program dongtaishuzu
 implicit none
 integer :: students
 integer, allocatable :: a(:) !dongtaishuzu  a(:,:) for 2d
 integer :: i
 integer :: error=0 
 
 write(*,*) "How many students: "
 read(*,*) students
 allocate(a(students),stat=error) !apply for memory
 !stat will pass an value to error. if success error=0 if failed error !=1
 write(*,*) error
 do i=1,students
    write(*,"('Number',i3)") i
    read(*,*) a(i)
 end do

end program dongtaishuzu
