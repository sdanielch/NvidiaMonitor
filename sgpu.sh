#!/bin/bash

watch -c -t -n 0.2 '
mydevice=$(nvidia-smi --query-gpu=timestamp,name,driver_version,utilization.gpu,utilization.memory,memory.total,memory.free,memory.used,temperature.gpu,power.draw.average,power.limit --format=csv | tail -n +2)
#readarray -d , -t adevice <<< "$mydevice"	
echo "\e[1mDatos: \e[0m" | xargs echo -n
echo "$mydevice" |  tr , "\n" | tail -n +0 | head -n 1
echo "\e[1mGráfica: \e[0m" | xargs echo -n
echo "$mydevice" | tr , "\n" | tail -n +2 | head -n 1
echo "\e[1mVersión del driver: \e[0m" | xargs echo -n
echo "$mydevice" | tr , "\n" | tail -n +3 | head -n 1
echo "\e[1mTemperatura: \e[0m" | xargs echo -n
echo "$mydevice" | tr , "\n" | tail -n +9 | head -n 1 | xargs echo -n
echo "ºC"
echo "\e[1mUso de la memoria: \e[0m" | xargs echo -n
echo "$mydevice" | tr , "\n" | tail -n +5 | head -n 1 | xargs echo -n
echo -n " ("
echo "$mydevice" | tr , "\n" | tail -n +8 | head -n 1 | xargs echo -n
echo -n "/"
echo "$mydevice" | tr , "\n" | tail -n +6 | head -n 1 | xargs echo -n
echo ")"
echo "\e[1mUso de la GPU: \e[0m" | xargs echo -n
echo "$mydevice" | tr , "\n" | tail -n +4 | head -n 1 
echo "\e[1mUso de energía: \e[0m" | xargs echo -n
echo "$mydevice" | tr , "\n" | tail -n +10 | head -n 1 | xargs echo -n
echo -n "/"
echo "$mydevice" | tr , "\n" | tail -n +11 | head -n 1
echo ""
echo "Presione Control + C para salir"

'
