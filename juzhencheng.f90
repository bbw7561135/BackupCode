program juzhencheng
!juzhen cheng is special
!if juzhen A weidu is L*M 
!if juzhen B weidu is M*N
!then C=A*B weidu must be L*N and A can cheng B de tiaojian jiushi L*M de M he M*N de M yi yang
 implicit none
    integer,parameter :: L=3,M=4,N=2
    real :: A(L,M)
    real :: B(M,N)
    real :: C(L,N) =0.
    real :: check(L,N)=0.
    data A /1,2,3,4,5,6,7,8,9,10,11,12/
    data B /1,2,3,4,5,6,7,8/
    integer i,j,k
    
    do i=1,L
        do j=1,N
            do k=1,M
                C(i,j) = C(i,j) + A(i,k) * B(k,j) !here should understand by pen 
            end do
        end do
    end do
 
 do i=1,L
    write(*,*) C(i,:) !display by row
 end do
 
 check = matmul(A,B)
 do i=1,L
    write(*,*) check(i,:) !display by row
 end do
  
 
end program juzhencheng
