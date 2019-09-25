program omp_lp
    use omp_lib
    implicit none
    integer :: thread_id
    integer :: b,i

    call omp_set_num_threads(3)

    b = 10


    thread_id = omp_get_thread_num()
    write(*,*) "before parallel......."
    write(*,*) "b is",b
    write(*,*) "enter parallel......."

    !$omp parallel do private(thread_id,i) firstprivate(b) lastprivate(b)
    do i=1,3
        thread_id = omp_get_thread_num()
        write(*,*) "my id is",thread_id
        write(*,*) "my original b is",b
        b = b + i*i
        write(*,*) "my new b is",b
    end do
    !$omp end parallel do

    write(*,*) "leave parallel......."
    write(*,*) "b is",b

end program omp_lp
