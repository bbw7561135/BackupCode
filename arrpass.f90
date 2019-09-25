program arrpass
    implicit none
    integer,parameter :: dim1 = 2
    integer,parameter :: dim2 = 2
    integer,parameter :: dim3 = 2
    integer :: arr(dim1,dim2,dim3)
    arr(:,:,1) = 1
    arr(:,:,2) = 2
    call getarray1(arr(:,:,1),dim1,dim2)
    call getarray2(arr(:,:,2),dim1)
end program arrpass

subroutine getarray1(arr,dim1,dim2)
    implicit none
    integer :: dim1,dim2
    integer :: arr(dim1,dim2)
    write(*,*) arr
    return
end subroutine getarray1

subroutine getarray2(arr,dim1)
    implicit none
    integer :: dim1
    integer :: arr(dim1,*)
    integer :: i
    write(*,*) (arr(:,i),i=1,2)
    return
end subroutine getarray2



