program hello
    use mpi
    use omp_lib !include 'omp_lib.h' is also ok
    implicit none
    integer :: i = 2 !each node only has 2 threads
    integer :: ierrmpi,myprocess,totalprocess
    integer :: thread_id,cpu_num

    call MPI_INIT(ierrmpi)
    call MPI_COMM_RANK(MPI_COMM_WORLD,myprocess,ierrmpi)
    call MPI_COMM_SIZE(MPI_COMM_WORLD,totalprocess,ierrmpi)

    call omp_set_num_threads(i) !set the thread nums
    !$omp parallel default(none) private(thread_id,cpu_num)
    !set thread_id and cpu_num as private var own by each thread
    thread_id = omp_get_thread_num()
    cpu_num = omp_get_num_threads()
    write(*,"(1x,'thread',i2,1x,'in total',1x,i2,1x,'threads per node')") thread_id,cpu_num
    !$omp end parallel
    write(*,*) "this is process ",myprocess
    write(*,*) "total process is",totalprocess

    call MPI_FINALIZE(ierrmpi)
end program hello
