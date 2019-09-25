module xianxingdaishu
    implicit none
contains
!qiu ju zhen hang lie shi de zhi
    real function determinant(matrix)
        implicit none
        real :: matrix(:,:)
        real,allocatable :: ma(:,:)
        integer :: i,n
        n = size(matrix,1)
        allocate(ma(n,n)) !san jiao ju zhen de qian ti jiu shi fang zhen nXn
        ma = matrix !bu gai bian chuan jin lai de ju zhen matrix
        call upper(ma)
        determinant = 1.0
        do i=1,n
            determinant = determinant * ma(i,i)
        end do
    end function determinant

    subroutine upper(matrix)
        implicit none
        real :: matrix(:,:)
        integer :: m,n
        integer :: i,j
        real :: e
        m = size(matrix,1) !hang shu
        n = size(matrix,2) !lie shu
        do i = 1, n-1 !di yi lie dao zui hou di er lie zui hou yi lie bu yong chu li
            do j = i+1, m !dui jiao xian yixia dou yao chuli
                e = matrix(j,i)/matrix(i,i) !yi lie yi lie chu li
                matrix(j,i:m) = matrix(j,i:m) - matrix(i,i:m)*e 
                !chu li dao i lie jiu biao shi qian mian dou shi 0 le
            end do
        end do
        return
    end subroutine upper

end module xianxingdaishu


program main 
    use xianxingdaishu
    implicit none
    integer,parameter :: n = 3
    real :: a(n,n) = reshape((/1,2,1,3,2,3,2,3,4/),(/n,n/))
    write(*,"('det(a)=',f8.3)") determinant(a)
end program main



















