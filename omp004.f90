program omp_fp
    use omp_lib
    implicit none
    integer :: thread_id
    integer :: a,b

    call omp_set_num_threads(2)

    a = 10
    b = 10


    thread_id = omp_get_thread_num()
    write(*,*) "before parallel......."
    write(*,*) "a is",a
    write(*,*) "b is",b
    write(*,*) "enter parallel......."

    !$omp parallel private(thread_id) firstprivate(a,b) 
    thread_id = omp_get_thread_num()

    write(*,*) "my id is",thread_id
    write(*,*) "my original a is",a
    write(*,*) "my original b is",b
    a = thread_id + 1 + a 
    b = thread_id + 1 + b
    write(*,*) "my new a is",a
    write(*,*) "my new b is",b
    !$omp end parallel

    write(*,*) "leave parallel......."
    write(*,*) "a is",a
    write(*,*) "b is",b

end program omp_fp




















