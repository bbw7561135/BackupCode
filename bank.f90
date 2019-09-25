module bank
    implicit none
    private :: money
    public :: loadmoney,savemoney,report
    integer(kind=4) :: money = 1000000 !kind=4 to reach max int
contains
    subroutine loadmoney(num)
        implicit none
        integer :: num
        money = money - num
        return
    end subroutine loadmoney


    subroutine savemoney(num)
        implicit none
        integer :: num
        money = money + num
        return
    end subroutine savemoney


    subroutine report()
        implicit none
        write(*,"('bank now has money:',i9,'Yuan')") money
    end subroutine report

end module bank

program yinhan
    use bank
    implicit none
    call loadmoney(100)
    call savemoney(2000)
    call report()
end program yinhan





























