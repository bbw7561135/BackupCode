program omp03
    use omp_lib !include 'omp_lib.h' is also ok
    implicit none
    integer :: i = 5 !set thread nums
    integer :: thread_id
    integer :: a,b,c,a1,b1

    write(*,*) "before parallel: "
    thread_id = omp_get_thread_num()
    call omp_set_num_threads(i) !set the thread nums
    a = 1
    b = 2
    c = 3
    write(*,*) 'a,b,c = ', a, b, c, ' id =  ', thread_id

    !see the website in csdn for key words shuo ming about private shared ...
    write( *,'(1x,a)' ) 'during parallel......'
    !$omp parallel private(a1,b1,thread_id) shared(c) 
    !or omp parallel default(private) shared(c)
    a1 = a
    b1 = b
    thread_id = omp_get_thread_num() !thread_id here is nothing to do with the var thread_id
    !in the chuanxing region 
    write(*,*) 'a,b,c = ', a1, b1, c, ' id =  ', thread_id
    !$omp barrier
    b1 = b1 + thread_id  
    c = c + thread_id !c is changed during each run because we do not know which thread change it
    !so c may be different from each run
    write(*,*) 'a,b,c = ', a1, b1, c, ' b and c changed!'
    !$omp end parallel

    thread_id = omp_get_thread_num()
    write(*,*) 'after parallel......'
    write(*,*) 'a,b,c = ', a, b, c, ' id =  ', thread_id
!a b is not changed as the a1 b1 in the parallel region has nothing to do with a b in chuanxing
!region while c is changed as it is shared with parallel region
end program omp03
