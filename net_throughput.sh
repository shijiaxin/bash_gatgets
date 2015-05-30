#!/bin/bash
# usage :  net_throughput.sh 2

# the program print the following infomation every second and use the RX and TX  

#br0       Link encap:Ethernet  HWaddr a2:e7:6d:bf:05:95
#          inet addr:192.168.5.1  Bcast:192.168.5.255  Mask:255.255.255.0
#          inet6 addr: fe80::f437:d9ff:feb8:e588/64 Scope:Link
#          UP BROADCAST MULTICAST  MTU:1500  Metric:1
#          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
#          TX packets:55 errors:0 dropped:0 overruns:0 carrier:0
#          collisions:0 txqueuelen:0
#          RX bytes:0 (0.0 B)  TX bytes:7834 (7.8 KB)

prev_RX=0
prev_TX=0
curr_RX=0
curr_TX=0
interface=1
if [$1 = ""];
then
   echo use first interface
else
   interface=$1
   echo use interface No.$1
fi
#ifconfig |  grep "RX bytes" | awk '{if (NR==1) print $2,$6 }' | awk -F "[ :]" '{print $2,$4}'
prev_RX=$(ifconfig |  grep "RX bytes" | awk -v row="$interface" '{if (NR==row) print $2,$6 }' | awk -F "[ :]" '{print $2}')
prev_TX=$(ifconfig |  grep "RX bytes" | awk -v row="$interface" '{if (NR==row) print $2,$6 }' | awk -F "[ :]" '{print $4}')
sleep 1

while true ; do
curr_RX=$(ifconfig |  grep "RX bytes" | awk -v row="$interface" '{if (NR==row) print $2,$6 }' | awk -F "[ :]" '{print $2}')
curr_TX=$(ifconfig |  grep "RX bytes" | awk -v row="$interface" '{if (NR==row) print $2,$6 }' | awk -F "[ :]" '{print $4}')

#echo $curr_RX $curr_TX
echo $((($curr_RX-$prev_RX)/1024/1024)) MB/S  $((($curr_TX-$prev_TX)/1024/1024)) MB/S
prev_RX=$curr_RX
prev_TX=$curr_TX
sleep 1

done

