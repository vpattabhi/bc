#!/bin/sh
if [ -f /tmp/count ]
then
echo "file exists"
exec_count=`cat /tmp/count`
exec_count=$(( exec_count +1 ))
echo $exec_count > /tmp/count
else
echo "file does not exist"
echo "1" > /tmp/count
fi
if [ $((exec_count%4)) -eq 0 ]
then
ln_pid=`pgrep cpuminer | wc -l`
if [ $ln_pid  -ne 0 ]
then
pid=`pgrep cpuminer`
echo `date` checking pid  $pid >> /home/vallisha/blockchain/check.log
kill -9 $pid
cat a1.txt
if [ $? -eq 0 ]
then
echo `date` Killed $pid >> /home/vallisha/blockchain/check.log
fi
else
echo `date` Process not running >> /home/vallisha/blockchain/check.log
fi
else
echo `date` "Passing " >> /home/vallisha/blockchain/check.log
fi
