module typedef
    type student
        integer :: chinese,english,math
    end type student
end module

program chengji
    use typedef !use shoule be in front of implicit none
    implicit none

    integer :: student_num ! student number is input by user
    type(student),allocatable :: s(:) !s is dong tai de 
    character(len=80) :: filename = "data.txt"
    integer,parameter :: field = 10
    integer :: i
    
    write(*,*) "How many students in your class?"
    read(*,*) student_num
    allocate(s(student_num),stat=i) !status of the allocate memory i.e. success or failure
    !i=0 means allocate is success
    if(i/=0)then
        write(*,*) "allocate buffer fails"
    end if
    
    open(unit=field,file=filename)
    do i=1,student_num
        write(*,"('input student ',i2, 'scores of chinese,english,math')") i
        read(*,*) s(i)%chinese,s(i)%english,s(i)%math !equal to read(*,*) s(i)
        write(unit=field,fmt="('seat',i2/,'chinese',i3,'english',i3,'math',i3)") i,s(i)
        !here unit = field will come with an syntax error 
        !reason is if you use unit= , hou mian de ge shi jiu ye yao xie cheng XX = 
        !bu neng yiban zhege geshi yiban nage geshi
        !dan shi qianmian shenglve houmian keyi bu shenglve 
        !ziji changshi
    end do
    close(unit=field)

end program chengji



















