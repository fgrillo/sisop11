set boxwidth 0.6
set yrange [0:650000]
set xlabel "Experimento" offset 0,-2
set ylabel "Throughput (KB/s)"
set title "EXT4 x ReiserFS"
set xrange [0:9]
unset xtics

set label "1-5" at 1.3,-30000 front
set label "2-6" at 3.3,-30000 front
set label "3-7" at 5.3,-30000 front
set label "4-8" at 7.3,-30000 front

set style fill solid 0.5

plot "write_ext4_2.dat" title "EXT4" with boxerror lc rgb "#FFC1AA", "write_reiserfs_23.dat" title "ReiserFS" with boxerror lc rgb "#66CDAA"
pause -1 "Hit any key to continue"
