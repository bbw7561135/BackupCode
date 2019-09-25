module bank

    implicit none
    integer(kind=4) :: money = 1000000
    integer :: fileid = 10
    private :: money,fileid
    private :: timelog

contains

subroutine timelog()
        implicit none
        integer(kind=4) :: num
        character(len=20) :: date,time
        call date_and_time(date,time)
        write(unit=fileid,fmt="('Date:',a8,'Time:',a2,':',a2,':',a2)")&
        date,time(1:2),time(3:4),time(5:6)
        return
end subroutine timelog

subroutine loadmoney(mingzi,num)
    implicit none
    character(len=*) :: mingzi
    integer(kind=4) :: num
    if(num<=0)then
        write(*,*) "unreasonable amount"
        return
    end if

    open(unit=fileid,file="log.txt",position="append")
    if(money >=num)then
        call timelog()
        write(unit=fileid,fmt="(a10,'take',i5,'yuan')") mingzi,num
        money = money - num
    else
        write(unit=fileid,fmt=*) "not enough money for you"
        write(*,*) "not enough money for you"
    end if
    close(unit=fileid)
    return
end subroutine loadmoney

subroutine savemoney(mingzi,num)
    implicit none
    character(len=*) :: mingzi
    integer(kind=4) :: num
    if(num<=0)then
        write(*,*) "unreasonable amount"
        return
    end if
    open(unit=fileid,file="log.txt",position="append")
    call timelog()
    write(unit=fileid,fmt="(a10,'deposit',i5,'yuan')") mingzi,num
    money = money + num 
    close(unit=fileid)
    return
end subroutine savemoney


end module bank

program yinhang
    use bank
    implicit none

    call savemoney("amao",10000)
    call savemoney("adong",2000)
    call loadmoney("amao",200)
    call loadmoney("adong",500)
end program yinhang




















