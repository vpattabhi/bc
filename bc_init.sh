#!/bin/sh
echo `date` Starting >> /home/vallisha/blockchain/init.log
ln_pid=`pgrep cpuminer | wc -l`
if [ $ln_pid -ne 0 ]
then
pid=`pgrep cpuminer`
echo "Process running not starting again " $pid >> /home/vallisha/blockchain/init.log
else
cd /home/vallisha/cpuminer-multi/
nohup ./cpuminer -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45700 -u venka_cp@yahoo.co.uk -p x &
fi
