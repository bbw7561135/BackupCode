program omp_critical
    use omp_lib
    implicit none

    integer :: thread_id
    integer :: pmaxout,pmaxin
    pmaxin=0
    pmaxout=0
    call omp_set_num_threads(3)

    !$omp parallel private(thread_id,pmaxin) shared(pmaxout)
    !$omp critical
    thread_id = omp_get_thread_num()
    call sleep(thread_id+1)
    write(*,*) "my id is",thread_id
    !$omp end critical
    !critical is different from master and single
    !it desgins to slove data competition
    pmaxin=omp_get_thread_num()
    !$omp critical 
    pmaxout=max(pmaxin,pmaxout)
    !$omp end critical

    !$omp end parallel
    write(*,*) "max is",pmaxout

end program omp_critical
