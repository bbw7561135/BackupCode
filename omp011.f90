program omp_reduction
    use omp_lib
    implicit none
    integer :: thread_id
    integer :: b(6)=2
    integer :: a(6)=6
    integer :: c(6)=3
    integer :: sumab,i,pdt,jianab
    sumab = 26
    pdt = 5
    jianab = 89

    call omp_set_num_threads(3)

    !$omp parallel do private(i,thread_id) shared(a,b) reduction(+:sumab)
    !sumab is private here for each thread by default
    !if reduction is + it equals sum all copies of sumab in threads plus the origin sumab in id0
    !sumab is set 0 regardless of its value in chuanxing region
    do i=1,6
        thread_id = omp_get_thread_num()
        write(*,*) "my id is ",thread_id
        write(*,*) "my current sum is ",sumab
    end do
    !$omp end parallel do
    write(*,*) "the total sum is ",sumab
    !$omp parallel do private(i,thread_id) shared(c) reduction(*:pdt)
    !sumab is private here for each thread by default
    !if reduction is * it equals cheng all copies of sumab in threads plus the origin sumab in id0
    !pdt is set=1 regardless of its value in chuanxing region
    do i=1,3
        thread_id = omp_get_thread_num()
        write(*,*) "my id is ",thread_id
        write(*,*) "my current pdt is ",pdt
    end do
    !$omp end parallel do
    write(*,*) "the total pdt is ", pdt

    !$omp parallel do private(i,thread_id) shared(a,b) reduction(-:jianab)
    !sumab is private here for each thread by default
    !if reduction is + it equals sum all copies of sumab in threads plus the origin sumab in id0
    !sumab is set 0 regardless of its value in chuanxing region
    do i=1,6
        thread_id = omp_get_thread_num()
        write(*,*) "my id is ",thread_id
        write(*,*) "my current sum is ",jianab
    end do
    !$omp end parallel do
    write(*,*) "the total sum is ",jianab

end program omp_reduction
