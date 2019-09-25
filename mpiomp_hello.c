#include <stdio.h>
#include <mpi.h>
#include <omp.h>
 
int main (int argc, char *argv[])
//      int argc;
//      char *argv[];
{
        int myid, numprocs, namelen;
        char processor_name[MPI_MAX_PROCESSOR_NAME];
 
        MPI_Init (&argc, &argv);        /* starts MPI */
        MPI_Comm_rank (MPI_COMM_WORLD, &myid);  /* get current process id */
        MPI_Comm_size (MPI_COMM_WORLD, &numprocs);      /* get number of processes */
        MPI_Get_processor_name(processor_name,&namelen);
 
        if(myid == 0) printf("number of processes: %d\n",numprocs);
        printf( "%s: Hello world from process %d \n", processor_name, myid);
        #pragma omp parallel
        {
            int iam, np;
            np = omp_get_num_threads();
            iam = omp_get_thread_num();
        
        #pragma omp critical
            printf("Hello world from %d out of %d from process %d\n",iam,np,myid);
            
        }
        MPI_Finalize();
        return 0;
}

//mpicc mpiomp_hello.c -o hello -fopenmp

//mpirun -np 5 -x OMP_NUM_THREADS=2 ./hello

