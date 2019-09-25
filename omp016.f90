program omp_sections
    use omp_lib
    implicit none
    integer::thread_id,num_thread
    call omp_set_num_threads(6)
    !$omp parallel sections private(thread_id,num_thread)

    !$omp section
    thread_id = omp_get_thread_num()
    num_thread = omp_get_num_threads()
    write(*,*) "sectionA 1: ", num_thread, thread_id

    !$omp section
    thread_id = omp_get_thread_num()
    num_thread = omp_get_num_threads()
    write(*,*) "sectionA 2: ", num_thread, thread_id

    !$omp section
    thread_id = omp_get_thread_num()
    num_thread = omp_get_num_threads()
    write(*,*) "sectionA 3: ", num_thread, thread_id
    !$omp end parallel sections
    write(*,*) "----------------------------------"
    !$omp parallel sections private(thread_id,num_thread)
    !$omp section
    thread_id = omp_get_thread_num()
    num_thread = omp_get_num_threads()
    write(*,*) "sectionB 1: ", num_thread, thread_id

    !$omp section
    thread_id = omp_get_thread_num()
    num_thread = omp_get_num_threads()
    write(*,*) "sectionB 2: ", num_thread, thread_id

    !$omp section
    thread_id = omp_get_thread_num()
    num_thread = omp_get_num_threads()
    write(*,*) "sectionB 3: ", num_thread, thread_id
    !$omp end parallel sections
end program omp_sections
