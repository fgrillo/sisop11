set boxwidth 0.3
set xrange [0:9]
set yrange [0:]
set xlabel "Experimento"
set ylabel "Throughput (MB/s)"
set xtics ("1-9" 1, "2-10" 2, "3-11" 3, "4-12" 4, "5-13" 5, "6-14" 6, "7-15" 7, "8-16" 8)
set key below
set terminal png

set style fill solid 0.5


# EXT4 vs. XFS

set title "EXT4 vs. XFS write op."
set output "ext4_xfs/ext4_xfs_write.png"
plot "ext4.dat" using ($1-0.17):($5/1024) title "EXT4" with boxes lc rgb "#FFC1AA",\
     "xfs.dat" using ($1+0.17):($5/1024) title "XFS" with boxes lc rgb "#6495ED",\
     "ext4.dat" using ($1-0.17):($5/1024):($6/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "xfs.dat" using ($1+0.17):($5/1024):($6/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3


set title "EXT4 vs. XFS read op."
set output "ext4_xfs/ext4_xfs_read.png"
plot "ext4.dat" using ($1-0.17):($7/1024) title "EXT4" with boxes lc rgb "#FFC1AA",\
     "xfs.dat" using ($1+0.17):($7/1024) title "XFS" with boxes lc rgb "#6495ED",\
     "ext4.dat" using ($1-0.17):($7/1024):($8/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "xfs.dat" using ($1+0.17):($7/1024):($8/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3

set title "EXT4 vs. XFS random read op."
set output "ext4_xfs/ext4_xfs_randread.png"
plot "ext4.dat" using ($1-0.17):($9/1024) title "EXT4" with boxes lc rgb "#FFC1AA",\
     "xfs.dat" using ($1+0.17):($9/1024) title "XFS" with boxes lc rgb "#6495ED",\
     "ext4.dat" using ($1-0.17):($9/1024):($10/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "xfs.dat" using ($1+0.17):($9/1024):($10/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3

set title "EXT4 vs. XFS random write op."
set output "ext4_xfs/ext4_xfs_randwrite.png"
plot "ext4.dat" using ($1-0.17):($11/1024) title "EXT4" with boxes lc rgb "#FFC1AA",\
     "xfs.dat" using ($1+0.17):($11/1024) title "XFS" with boxes lc rgb "#6495ED",\
     "ext4.dat" using ($1-0.17):($11/1024):($12/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "xfs.dat" using ($1+0.17):($11/1024):($12/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3


set xtics ("1-5" 1, "2-6" 2, "3-7" 3, "4-8" 4)
# EXT4 vs. ReiserFS

set title "EXT4 vs. ReiserFS write op."
set output "ext4_reiser/ext4_reiserfs_write.png"
plot [0.5:4.5]\
     "ext4.dat" using ($1-0.17):($5/1024) title "EXT4" with boxes lc rgb "#FFC1AA",\
     "reiserfs.dat" using ($1+0.17):($5/1024) title "ReiserFS" with boxes lc rgb "#66CDAA",\
     "ext4.dat" using ($1-0.17):($5/1024):($6/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "reiserfs.dat" using ($1+0.17):($5/1024):($6/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3


set title "EXT4 vs. ReiserFS read op."
set output "ext4_reiser/ext4_reiserfs_read.png"
plot [0.5:4.5]\
     "ext4.dat" using ($1-0.17):($7/1024) title "EXT4" with boxes lc rgb "#FFC1AA",\
     "reiserfs.dat" using ($1+0.17):($7/1024) title "ReiserFS" with boxes lc rgb "#66CDAA",\
     "ext4.dat" using ($1-0.17):($7/1024):($8/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "reiserfs.dat" using ($1+0.17):($7/1024):($8/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3

set title "EXT4 vs. ReiserFS random read op."
set output "ext4_reiser/ext4_reiserfs_randread.png"
plot [0.5:4.5]\
     "ext4.dat" using ($1-0.17):($9/1024) title "EXT4" with boxes lc rgb "#FFC1AA",\
     "reiserfs.dat" using ($1+0.17):($9/1024) title "ReiserFS" with boxes lc rgb "#66CDAA",\
     "ext4.dat" using ($1-0.17):($9/1024):($10/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "reiserfs.dat" using ($1+0.17):($9/1024):($10/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3

set title "EXT4 vs. ReiserFS random write op."
set output "ext4_reiser/ext4_reiserfs_randwrite.png"
plot [0.5:4.5]\
     "ext4.dat" using ($1-0.17):($11/1024) title "EXT4" with boxes lc rgb "#FFC1AA",\
     "reiserfs.dat" using ($1+0.17):($11/1024) title "ReiserFS" with boxes lc rgb "#66CDAA",\
     "ext4.dat" using ($1-0.17):($11/1024):($12/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "reiserfs.dat" using ($1+0.17):($11/1024):($12/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3

# XFS vs. ReiserFS

set title "XFS vs. ReiserFS write op."
set output "xfs_reiser/xfs_reiserfs_write.png"
plot [0.5:4.5]\
     "xfs.dat" using ($1-0.17):($5/1024) title "XFS" with boxes lc rgb "#6495ED",\
     "reiserfs.dat" using ($1+0.17):($5/1024) title "ReiserFS" with boxes lc rgb "#66CDAA",\
     "xfs.dat" using ($1-0.17):($5/1024):($6/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "reiserfs.dat" using ($1+0.17):($5/1024):($6/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3

set title "XFS vs. ReiserFS read op."
set output "xfs_reiser/xfs_reiserfs_read.png"
plot [0.5:4.5]\
     "xfs.dat" using ($1-0.17):($7/1024) title "XFS" with boxes lc rgb "#6495ED",\
     "reiserfs.dat" using ($1+0.17):($7/1024) title "ReiserFS" with boxes lc rgb "#66CDAA",\
     "xfs.dat" using ($1-0.17):($7/1024):($8/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "reiserfs.dat" using ($1+0.17):($7/1024):($8/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3

set title "XFS vs. ReiserFS random read op."
set output "xfs_reiser/xfs_reiserfs_randread.png"
plot [0.5:4.5]\
     "xfs.dat" using ($1-0.17):($9/1024) title "XFS" with boxes lc rgb "#6495ED",\
     "reiserfs.dat" using ($1+0.17):($9/1024) title "ReiserFS" with boxes lc rgb "#66CDAA",\
     "xfs.dat" using ($1-0.17):($9/1024):($10/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "reiserfs.dat" using ($1+0.17):($9/1024):($10/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3

set title "XFS vs. ReiserFS random write op."
set output "xfs_reiser/xfs_reiserfs_randwrite.png"
plot [0.5:4.5]\
     "xfs.dat" using ($1-0.17):($11/1024) title "XFS" with boxes lc rgb "#6495ED",\
     "reiserfs.dat" using ($1+0.17):($11/1024) title "ReiserFS" with boxes lc rgb "#66CDAA",\
     "xfs.dat" using ($1-0.17):($11/1024):($12/1024) title "Int. Conf." with yerrorbars lc rgb "black" pt 1 ps 0.3,\
     "reiserfs.dat" using ($1+0.17):($11/1024):($12/1024) notitle with yerrorbars lc rgb "black" pt 1 ps 0.3
