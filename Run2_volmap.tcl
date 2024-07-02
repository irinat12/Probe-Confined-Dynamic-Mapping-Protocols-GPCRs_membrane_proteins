set atoms "17"
mol load psf ./structure.psf  
#mol addfile ./run.dcd type dcd first 0 last -1 step 10 filebonds 1 autobonds 1 waitfor all
mol addfile ./run2_1.dcd type dcd first 0 last -1 step 10 filebonds 1 autobonds 1 waitfor all
set frames [molinfo top get numframes]
set fp [open "IntRun2_volmap.txt" w]
puts $fp "Frame\tHD"
for {set i 0} {$i < $frames} {incr i} {
                set a [atomselect top "(( x > -12 and x < 2) and ( y > -2 and y < 9 ) and ( z > -25 and z < -10) and not water and not lipids and not ions and not protein and not resname LIG)" frame $i]
                set numa [$a num]
                set lnuma [expr ($numa/$atoms)]
               puts  $fp "$i $lnuma "
}
close $fp
exit

