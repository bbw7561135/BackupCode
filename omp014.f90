program omp_conditionif
    use omp_lib
    implicit none
    integer :: num_threads,thread_id,num_cpus

    num_cpus = omp_get_num_procs() !get max cores
    write(*,*) "num of total cpus",num_cpus
    write(*,*) "-------------------------"
    !$omp parallel private(num_threads,thread_id) if (num_cpus>1)
    num_threads = omp_get_num_threads()
    thread_id = omp_get_thread_num()
    write(*,*) thread_id
    !$omp end parallel
end program omp_conditionif
