program omp_master
    use omp_lib
    implicit none
    integer :: thread_id,num_threads

    call  omp_set_num_threads(3)

    !$omp parallel private(thread_id,num_threads)
    num_threads = omp_get_num_threads()
    thread_id =  omp_get_thread_num()
    write(*,*) "before master---total threads:",num_threads,"my id is",thread_id

    !$omp master 
    thread_id =  omp_get_thread_num()
    call sleep(3)
    write(*,*) "master thread is ",thread_id
    !$omp end master
    !master is different from single
!    !$omp barrier
    num_threads = omp_get_num_threads()
    thread_id =  omp_get_thread_num()
    write(*,*) "after master---total threads:",num_threads,"my id is",thread_id
    !$omp end parallel

end program omp_master
