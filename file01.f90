program duxiewenjian
    implicit none
    character(len=20) :: string

    open(unit=10,file="test.txt")
    write(10,"(a20)") "Good Morning."
    rewind(10) !jiang wen jian zhi zhen you fan hui kai tou
    read(10,"(a20)") string !read nei rong in to string
    write(*,"(a20)") string
end program duxiewenjian

