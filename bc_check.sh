#!/bin/sh
ln_pid=`pgrep cpuminer | wc -l`
if [ $ln_pid  -ne 0 ]
then
pid=`pgrep cpuminer`
echo `date` checking pid  $pid >> /home/vallisha/blockchain/check.log
kill -9 $pid
if [ $? -eq 0 ]
then
echo `date` Killed $pid >> /home/vallisha/blockchain/check.log
fi
else
echo `date` Process not running >> /home/vallisha/blockchain/check.log
fi
