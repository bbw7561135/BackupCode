program fmtout
 implicit none
 character(len=80) string
 write(*,"(B6.5)") 3 !use binary format O represent 8jinzhi Z represent 16jinzhi
 write(*,"(3(1XF5.2))") 1.0,2.0,3.0 !3(1xf5.2)=1xf5.2,1xf5.2,1xf5.2
 read(*,"(A80)") string
 write(*,"(A80)") string
end program fmtout
