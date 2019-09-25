program calpi
    use mpi
    implicit none
    integer(kind=4) :: myid,numprocs,ierr !MPI han shu zhi jie shou kind=4 de int
    integer(kind=4) :: n,i
    real(kind=8) :: mypi,pi,h,sumf,x
    real(kind=8) :: start_time = 0.0,end_time
    real(kind=8) :: pi_ref = 3.1415926535897932384
    !each rank has it own mypi pi ... which means all ranks run the code independently
    !except we focus on specific rank to do sth or to do communation
    call MPI_INIT(ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myid,ierr)

    if(myid==0)then
        write(*,*) "please give the total interval numbers N:"
        read(*,*) n
        start_time = MPI_WTIME()
    end if

    call MPI_BCAST(n,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierr)
    !from rank0 to broadcast to all ranks
    h=1.d0/dble(n)
    sumf = 0.d0
    do i=myid+1,n,numprocs !myid is from 0 so + 1 !numprocs means tiao zhe lai
        x = h*(dble(i)-0.5d0) !juxing zhong jian dian de zuo biao
        sumf = sumf + f(x) !f(x) ding yi zai xia mian
    end do
    mypi = h*sumf !area of jifen = pi
    call MPI_REDUCE(mypi,pi,1,MPI_DOUBLE_PRECISION,MPI_SUM,0,MPI_COMM_WORLD,ierr)
    !each rank chuan song mypi to rank0 for sum and the result will put in pi
    !1 means count
    if(myid==0)then
        write(*,*) "PI is approximately",pi,"and the error is",abs(pi-pi_ref)
        end_time=MPI_WTIME()
        write(*,*) "Time used is ",end_time-start_time
    end if

    call MPI_FINALIZE(ierr)

contains
    real(kind=8) function f(x)
        real(kind=8) :: x
        f = 4.0d0/(1.0d0+x**2)
    end function f

end program calpi














































