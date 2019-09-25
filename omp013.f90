program omp_setthreads
    use omp_lib
    implicit none
    integer :: thread_id, num_threads,thread_set

    !$omp parallel private(num_threads,thread_id) 
    num_threads = omp_get_num_threads() 
    thread_id = omp_get_thread_num() 
    write(*,*) "number of threads(default) = ", num_threads
    write(*,*) "id = ", thread_id
    !$omp end parallel

    thread_set = 3
    call omp_set_num_threads(thread_set)
    !$omp parallel private(num_threads,thread_id) 
    num_threads = omp_get_num_threads() 
    thread_id = omp_get_thread_num() 
    write(*,*) "number of threads(set) = ", num_threads
    write(*,*) "id = ", thread_id
    !$omp end parallel

end program omp_setthreads

