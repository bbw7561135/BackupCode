program wenjian
    implicit none
    open(unit=10,file='hello.txt')
    write(10,*) "Hello, here is Yunnan University."
end program wenjian 
!the unit number is better avoid 1 2 5 6 which is used by system
!so > = 10 is oK
