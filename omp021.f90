program omp_clock
    use omp_lib
    implicit none

    integer(kind=4),parameter :: n = 100000
    integer :: i,j

    real(kind=8) :: starttime,endtime,usedtime
    real(kind=8) :: y

    call omp_set_num_threads(3)
    starttime = omp_get_wtime()

    write(*,*) "starttime = ", starttime, " seconds "

    !$omp parallel do private(i,j,y)
    do i=1,n
        do j=1,n
            y = log(i*1.0+1.0)
        end do
    end do
    !$omp end parallel do

    endtime = omp_get_wtime()
    write(*,*) "endtime = ", endtime, " seconds "
    usedtime = endtime - starttime
    write(*,*) "usedtime = ", usedtime, " seconds "

end program omp_clock








