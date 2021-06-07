numero=$(ps -aux | grep "namd2" | head -1 | awk '{print $2}')
#while ps -p $numero > /dev/null; do sleep 1; done; acemd input > log.txt &
while ps -p $numero > /dev/null; do sleep 1; done; /usr/local/NAMD_Git-2017-12-19_Linux-x86_64-multicore-CUDA/namd2 +idlepoll +p18 +devices 0,1 run2.conf > run2.log &

