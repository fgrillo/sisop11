set boxwidth 0.6
set yrange [0:650000]
set xlabel "Experimento" offset 0,-2
set ylabel "Throughput (KB/s)"
set title "XFS x ReiserFS"
set xrange [0:9]
unset xtics

set label "1-5" at 1.3,-30000 front
set label "2-6" at 3.3,-30000 front
set label "3-7" at 5.3,-30000 front
set label "4-8" at 7.3,-30000 front

set style fill solid 0.5

plot "write_xfs_3.dat" title "XFS" with boxerror lc rgb "#6495ED" lw 1, "write_reiserfs_23.dat" title "ReiserFS" with boxerror lc rgb "#66CDAA" lw 1
pause -1 "Hit any key to continue"
