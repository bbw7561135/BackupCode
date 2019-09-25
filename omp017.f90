program omp_nowait
    use omp_lib
    implicit none

    integer :: thread_id,i,j

    call omp_set_num_threads(3)
    !$omp parallel private(thread_id,i,j)
    !$omp do
    do i=1,3
        thread_id = omp_get_thread_num()
        write(*,*) "thread_id ",thread_id,"enter first parallel region."
        call sleep(thread_id+1)
        write(*,*) "thread_id ",thread_id,"leave first parallel region."
    end do 
    !$omp end do nowait

    !$omp do
    do j=1,3 !here can not use i again because of nowait
        thread_id = omp_get_thread_num()
        write(*,*) "thread_id ",thread_id,"enter second parallel region."
        write(*,*) "thread_id ",thread_id,"leave second parallel region."
    end do
    !$omp end do

    !$omp end parallel


end program omp_nowait
