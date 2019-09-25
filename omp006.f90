module global
    use omp_lib
    implicit none
    integer :: a = 126 !chu shihua shi hou jiu fuzhu hui zidai save shu xing
    !$omp threadprivate(a)
    !if in main program use threadprivate(a) it will fail
end module global

program omp_thp
    use global
    use omp_lib
    implicit none
    integer :: thread_id
    integer :: b = 10 !should be saved attritubes i.e quan ju shuxing
!    integer :: b !    common /c1/ b
    !$omp threadprivate(b)
    !the parameter in threadprivate should be common blocks or saved var
    !can not threadprivate with var defined in other module
    call omp_set_num_threads(2)
    !quite different from firstprivate lastprivate private
    thread_id = omp_get_thread_num()
    write(*,*) "before parallel......."
    write(*,*) "Global b is",b
    write(*,*) "Global a is",a
    write(*,*) "enter parallel1......."
    !$omp parallel private(thread_id)
    thread_id = omp_get_thread_num()
    b = b + thread_id + 1
    a = a + thread_id*thread_id + 1
    write(*,*) "my id is ", thread_id
    write(*,*) "my b is ",b
    write(*,*) "my a is ",a
    !$omp end parallel
    write(*,*) "Global b is",b
    write(*,*) "Global a is",a
    write(*,*) "enter parallel2......."
    !$omp parallel private(thread_id)
    thread_id = omp_get_thread_num()
    b = b + thread_id + 1
    a = a + thread_id*thread_id + 1
    write(*,*) "my id is ", thread_id
    write(*,*) "my b is ",b
    write(*,*) "my a is ",a
    !$omp end parallel
    write(*,*) "leave parallel......."
    write(*,*) "Global b is",b
    write(*,*) "Global a is",a
end program omp_thp


