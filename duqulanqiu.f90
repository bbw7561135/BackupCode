module typedef
    type player
        character(len=80) :: mingzi
        real :: weight,height
        real :: scorep
    end type player
end module typedef

program dulanqiu
    use typedef
    implicit none
    character(len=20) :: filename = "lanqiu.txt"
    integer,parameter :: field = 20
    logical :: alive !file exist or not
    type(player) :: p !player include weight height score
    character(len=15) :: title !weight height score name
    real :: tempnum !data from p i.e. w h s name
    logical,external :: get_next_player
    integer :: i
    integer :: error

    inquire(file=filename,exist=alive)
    if(.not. alive) then
        write(*,*) trim(filename),"do not exist."
        stop !here stop can not be ignored
    end if

    open(unit=field,file=filename)
    do while(.true.)
        if(get_next_player(field,p%mingzi))then
            do i=1,3
                read(field,"(a6,1x,f5.1)",iostat=error) title,tempnum !a6=nameid weight height scorep 1x=: f=num
                if(error/=0)then
                    write(*,*) "file reading comes with an error"
                    stop !here stop can not be ignored
                end if
                select case(title)
                case("height")
                    p%height = tempnum
                case("weight")
                    p%weight = tempnum
                case("scorep")
                    p%scorep = tempnum
                case default
                    write(*,*) "wrong data input"
                    stop
                end select
            end do
        else
            exit ! no data leave loop
        end if
        if(p%scorep > 20.0)then
            write(*,"('name:'a8/,'height:'f5.1,'weight:'f5.1,'score:'f5.1)") p
        end if
    end do

end program dulanqiu


logical function get_next_player(field,mingzi)
    implicit none
    integer,intent(in) :: field
    character(len=*),intent(out) :: mingzi
    character(len=80) :: title
    integer :: error

    do while(.true.)
        read(field,"(a80)",iostat=error) title
        if(error/=0)then
            get_next_player = .false.
            return
        end if
        
        if(title(1:6)=="nameid")then
            mingzi = title(8:)
            get_next_player = .true.
            return
        end if
    end do

    return
end function get_next_player


























