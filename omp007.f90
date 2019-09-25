program omp_thp
    use omp_lib
    implicit none
    integer :: thread_id
    integer :: b = 10 !should be saved attritubes i.e quan ju shuxing
!    integer :: b
!    common /c1/ b
    !$omp threadprivate(b)
    !the parameter in threadprivate should be common blocks or saved var
    !can not threadprivate with var defined in other module
    call omp_set_num_threads(2)
    !quite different from firstprivate lastprivate private
    thread_id = omp_get_thread_num()
    write(*,*) "before parallel......."
    write(*,*) "Global b is",b
    write(*,*) "enter parallel1......."
    !$omp parallel private(thread_id)
    thread_id = omp_get_thread_num()
    b = b + thread_id
    write(*,*) "my id is ", thread_id
    write(*,*) "my b is ",b
    !$omp end parallel
    write(*,*) "Global b is",b
    write(*,*) "enter parallel2......."
    !$omp parallel private(thread_id) copyin(b)
    !copyin(b) is broadcast the b in id 0 to all
    !the parameter in copyin must be threadprivate
    thread_id = omp_get_thread_num()
    b = b + thread_id
    write(*,*) "my id is ", thread_id
    write(*,*) "my b is ",b
    !$omp end parallel
    write(*,*) "leave parallel......."
    write(*,*) "Global b is",b
end program omp_thp

