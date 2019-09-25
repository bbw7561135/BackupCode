program omptest02
    use omp_lib
    implicit none
    integer :: thread_id,cpu_num
    integer :: i = 5 !set the threads number

    call omp_set_num_threads(i)

    thread_id = omp_get_thread_num() !get the current thread id
    !because it is not in the parallel region so thread_id = 0 i.e. main thread
    cpu_num = omp_get_num_threads() !get the total threads
    !because it is not in the parallel region so cpu_num = 1
    write(*,*) "before parallel: "
    write(*,*) "this is thread ",thread_id,"in total ",cpu_num,"threads"
    write(*,*) !huan hang

    write(*,*) "during parallel: "
    !$omp parallel default(none) private(thread_id,cpu_num)
    !set thread_id and cpu_num as private var own by each thread
    !so each thread put its own id out (0-9) but the cpu_num should always be 10
    thread_id = omp_get_thread_num() + 1
    cpu_num = omp_get_num_threads()
    write(*,*) "this is thread ",thread_id,"in total ",cpu_num,"threads"
    !$omp end parallel
    write(*,*) !huan hang
    write(*,*) "after parallel: "
    write(*,*) "this is thread ",thread_id,"in total ",cpu_num,"threads"
end program omptest02




