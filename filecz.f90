program wenjian
    implicit none
    integer,parameter :: inputfileid = 10, outputfileid = 11
    integer,parameter :: maxbuffer = 200 !max temp content is 200 byte
    character(len=80) :: inputfile,outputfile
    character(len=maxbuffer) :: buffer
    integer :: counts
    integer :: error
    logical :: alive 

    write(*,*) "input filename:"
    read(*,"(a80)") inputfile
    write(*,*) "output filename:"
    read(*,"(a80)") outputfile

    inquire(file=inputfile,exist=alive)
    if(.not. alive)then
        write(*,*) trim(inputfile),"do not exist."
        stop !can not be ignored
    end if

    open(unit=inputfileid,file=inputfile,status="old")
    open(unit=outputfileid,file=outputfile,status="replace")
    counts = 1
    do while(.true.)
        read(inputfileid,"(a200)",iostat=error) buffer
        if(error/=0)then
            exit
        end if
        write(outputfileid,"(i3,'.',a)") counts,trim(buffer) !here a is enough
        counts = counts + 1
    end do
end program wenjian





































































