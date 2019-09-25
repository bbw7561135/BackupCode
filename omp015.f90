program omp_schedule_static
    use omp_lib
    implicit none
    integer,parameter :: n = 12
    integer :: num_thread, thread_id, i

    call omp_set_num_threads(3)

    !$omp parallel do private(i,thread_id,num_thread) schedule(static)
    do i=1,n
        thread_id = omp_get_thread_num()
        num_thread = omp_get_num_threads()
        write(*,*) "total id is",num_thread
        write(*,*) "my id is", thread_id,"my i is",i
    end do
    !$omp end parallel do
    write(*,*) "-----------fen ge xian--------------"
    !$omp parallel do private(i,thread_id,num_thread) schedule(static,3)
    do i=1,n
        thread_id = omp_get_thread_num()
        num_thread = omp_get_num_threads()
        write(*,*) "total id is",num_thread
        write(*,*) "my id is", thread_id,"my i is",i
    end do
    !$omp end parallel do

end program omp_schedule_static
