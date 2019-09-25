program omp_ordered
    use omp_lib
    implicit none
    integer,parameter :: n = 12
    integer :: thread_id,i

    call omp_set_num_threads(3)

    !$omp parallel do ordered private(thread_id,i)
    do i=1,n
        !$omp ordered
        thread_id = omp_get_thread_num()
        write(*,*) "No.",i,"with thread_id ",thread_id
        !$omp end ordered
    end do
    !$omp end parallel do
    !also ordered is desgined to solove data competition
end program omp_ordered
