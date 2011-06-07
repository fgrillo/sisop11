set boxwidth 0.6
set yrange [0:650000]
set xlabel "Experimento" offset 0,-2
set ylabel "Throughput (KB/s)"
set title "EXT4 x XFS"
set xrange [0:17]
unset xtics

set label "1-9" at 1,-30000 front
set label "2-10" at 3,-30000 front
set label "3-11" at 5,-30000 front
set label "4-12" at 7,-30000 front
set label "5-13" at 9,-30000 front
set label "6-14" at 11,-30000 front
set label "7-15" at 13,-30000 front
set label "8-16" at 15,-30000 front

set style fill solid 0.5

plot "write_ext4_1.dat" title "EXT4" with boxerror lc rgb "#FFC1AA", "write_xfs_1.dat" title "XFS" with boxerror lc rgb "#6495ED"
pause -1 "Hit any key to continue"
