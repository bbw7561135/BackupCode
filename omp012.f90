program test_ompinparallel
    use omp_lib
    implicit none
    integer :: thread_id,num_threads

    call omp_set_num_threads(3)

    num_threads = omp_get_num_threads()
    thread_id = omp_get_thread_num()
    if(omp_in_parallel())then !in parallel the omp_in_parallel = true else false
        write(*,*) 'In the parallel region!, id = ', thread_id
        write(*,*) 'number of threads:',num_threads
    else
        write(*,*) 'In the serial region!, id = ', thread_id
        write(*,*) 'number of threads:',num_threads
    end if

    !$omp parallel private(thread_id,num_threads)
    num_threads = omp_get_num_threads()
    thread_id = omp_get_thread_num()
    if(omp_in_parallel())then !in parallel the omp_in_parallel = true else false
        write(*,*) 'In the parallel region!, id = ', thread_id
        write(*,*) 'number of threads:',num_threads
    else
        write(*,*) 'In the serial region!, id = ', thread_id
        write(*,*) 'number of threads:',num_threads
    end if
    !$omp end parallel

end program test_ompinparallel
